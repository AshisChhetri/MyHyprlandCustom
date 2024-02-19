import { Subitem } from "./subitem";
export class Item {
    id:string | undefined;
    name:string | undefined;
    subitems: Subitem[] | undefined;
}