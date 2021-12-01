import { Args, Query, Resolver } from '@nestjs/graphql';
import { AppService } from './app.service';

@Resolver(() => String)
export class AppResolver {
  constructor(private readonly appService: AppService) {}

  @Query(() => String)
  async hello(@Args('name') name: string): Promise<string> {
    return this.appService.getHello(name);
  }
}
