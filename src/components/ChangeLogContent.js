import React from 'react';
import {Link, Stack} from '@shopify/polaris';

export default function ChangeLogContent({newVersion} = props) {
  return (
    <div>
      <h3 id="changelog">Change Log</h3>

      <ul>
        <li>Added cart discounted subtotal tier type option in tiered discount.</li>
      </ul>

      <div style={{paddingTop: '2rem'}}>
        <Stack distribution="trailing">
          <Link url="https://github.com/jgodson/shopify-script-creator/releases">
            View previous releases
          </Link>
        </Stack>
      </div>
    </div>
  );
}
