Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1B4E8F9C
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Mar 2022 10:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E660210E068;
	Mon, 28 Mar 2022 08:00:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF42610E068
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Mar 2022 08:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+8/xeGTINJYOPObhy4zQy0bgTAamlQJ5s/FhhH2/bVT1/b8oV6ocV9M2e3zjGz3k3Ir33zHuIpYnddZ6IvAR57xtyxdtTSnnzAntUZlzkiXwtIK/x9OrmR9hni/tp72FsuEpDCgevOWq70cbfAfBf6kkN7XzeBLU8I9gMwKw9zn3WmnxTLrkF6MK17HvQ1xUwJ0F8S+knC5R4vGni3ERpyz09/KjXQ3HT6BOGiKhGZOxikD58svyCtG3w7wCsVxGA1VITCm80n757WzXOnZRFn1aUC3pxfvVSMixjyDZEEDy+PW3/Nz2235hrB0JkPagKxHHin7k5cQW7VbHN/BUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+D5KXHtA67eDJS8fpC9BbMDvLJH5ydgnqNaYJr3OgA=;
 b=OpKTOujC7up9doF3XBX2QB3V1R1bDLmgTjd2uaZcLEGAhT+CfrXcIvVbCOxNHLgyJ3bFHixRZt6EZKiFB9s+PhnHbTKpinjtK0RgW8DHsXkioC8bsJNKUOFIzo3KIuV9beozErPhvNUn4IAFiMQHmG2bJIb8CROX3Xa2B+jkpLfVgVLdD0rBbjkZOJdIGtfSMNPAIHPgGs0otEAcrMnfa9pkFr7cLjYQREva1wRnesdOGrwgbie/8KEoOYYUHYMI7g7qYfVw/ktaR0e5SV0VdGNR5vSD62dqINxbBbe/lW4XFdhKD9BPPR471v/TY/vua+57HAF/EEWTVOCqOXuMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+D5KXHtA67eDJS8fpC9BbMDvLJH5ydgnqNaYJr3OgA=;
 b=3qxOunubdlsdtMnpjNfEz62A/7zXuAPS66t/fM/I6r5l2a6Qj0Ly+X/+pwVUxI+XcyrHbWjbhyqIxBdwEh283VMZY91Gau7iW7Uwqck7kLAUSS30solhxqmxJSvcNdhuBzufaTUvv3IB1MGyB+yQYTeabUPV+pC1tGajBSnHp3M=
Received: from PH0PR12MB5451.namprd12.prod.outlook.com (2603:10b6:510:ee::20)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Mon, 28 Mar
 2022 08:00:56 +0000
Received: from PH0PR12MB5451.namprd12.prod.outlook.com
 ([fe80::9cf6:6683:b92b:ae42]) by PH0PR12MB5451.namprd12.prod.outlook.com
 ([fe80::9cf6:6683:b92b:ae42%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 08:00:56 +0000
From: "Ziya, Mohammad zafar" <Mohammadzafar.Ziya@amd.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH v4 5/6] drm/amdgpu/vcn: VCN ras error query support
Thread-Topic: [PATCH v4 5/6] drm/amdgpu/vcn: VCN ras error query support
Thread-Index: AQHYQmyab1uU8owgCUWioXdX2ewBnKzUaiWAgAACcgCAAACmUA==
Date: Mon, 28 Mar 2022 08:00:56 +0000
Message-ID: <PH0PR12MB545100117A4F02A2C98BCE0E981D9@PH0PR12MB5451.namprd12.prod.outlook.com>
References: <20220328062453.4156191-1-Mohammadzafar.ziya@amd.com>
 <20220328062453.4156191-6-Mohammadzafar.ziya@amd.com>
 <DM5PR12MB17706851354758760795883DB01D9@DM5PR12MB1770.namprd12.prod.outlook.com>
 <3c80e4e5-97fc-9222-d9a3-f676125b0f5c@molgen.mpg.de>
In-Reply-To: <3c80e4e5-97fc-9222-d9a3-f676125b0f5c@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-28T08:00:41Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=01f85079-dea2-4ec9-a152-0485cd2b0979;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-03-28T08:00:41Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: fb3fb262-1896-4091-bcc0-36f0be963f9f
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56e88231-fc9b-4a9f-8c13-08da109116ce
x-ms-traffictypediagnostic: MN2PR12MB4357:EE_
x-microsoft-antispam-prvs: <MN2PR12MB43576A5590208C8DC8CC1EA9981D9@MN2PR12MB4357.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LFcBKePE497CbPb1PqdrY9WO7w7kiJRTxGV9lvI8GiPl7sa4VaB+2fYv5lOw/jYB6tlu/fTtL0qw58p+0dggMHEIF8XIOZez+r6IFMpVOOze/zBtaVh0Z8nKQi59W8Pfr+gzZYPW3DlnSlGApYtbf+oAcYADs5byjzFJxRGiThNqFm3C1O9p+D0KnJfpIOqbG/yvfxePoTxjo63iouaOQ50OU+JhzmU7yZHEgOxf2rRNOFWDszHC16QaQjDvF/ckdY8+vL7RhwQI3jCKLRbcy2qguPbfhtlKuOjUicbGDXtSy/QsAhlJ8kSaK07qQQT8MXCV9VpWINmmz7yUS8x99MVXDjTE3Z/RRpM6vtpLAg+SUyVs5R8UD35A8xLL6OrH8VD+BuVDwaLRH5VwLDqwBXqWF1GpmjsYePAJwza3j9qLHmMYmzCTQNxOSA8u4Xqqqmbc5nwuZ/MHW5oU9oSGZo3OyGANzSeSqI5FUOIWVLdHeOm5BTnkgNtYYsIxZDEuJSzmkYohFs22aJOpCSoDM6vZxf/6pinLbGmeBth4h9odUebPzKcs3Q3nPEQ56f4JEThGADOyeziMskmFjrLY0U+HNTrPmlsE6iK7wD2ifhPQ9eb7fafEz1pUbQO/pRpbw6F9VzcUz58tk/b/5WJuyMOuZ1voCekPRSC+3xt1FdeASiVdGhOIi9WB+zH5eGDvOB5rCrgG2kPoQ2Fu7EFw7wJLpDWMff7H6hFNerds5rM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5451.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(83380400001)(5660300002)(6506007)(8936002)(2906002)(55236004)(6636002)(186003)(55016003)(52536014)(53546011)(7696005)(26005)(54906003)(110136005)(76116006)(86362001)(66446008)(66476007)(64756008)(8676002)(38100700002)(66946007)(4326008)(33656002)(66556008)(71200400001)(122000001)(508600001)(316002)(38070700005)(309714004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVd5eGFaSnFVWkc4dzhoeXlVYkVVc1NBMjNUS2N3UHdqNmo0dnJRbmxmZTRu?=
 =?utf-8?B?TUF6a2FKNjh3Ym05Z1ZMdG1kY0VRTHRRN1FTRENIeStFMVBuZlBsVWhaL0gr?=
 =?utf-8?B?eG9IZVNDL2ZRUWZMOGlTb29ZK2xmNmNXRlRYek9BWDJiRGtGOGZ3aHMzRGVw?=
 =?utf-8?B?bDhKb095RHFSTGpMZ0VPckhRT0U2MEZkM0VqYkZtbThNMzVmZHE3QWhJNTVo?=
 =?utf-8?B?bHBhcktMa09LMkg2b0c5d1NKdHArVVZYQklUaDJRM0E2SG1DQVBjSVMycFZo?=
 =?utf-8?B?V0lkcCtHVURHd2pzeERuTG5SdVVnOWdKSkZsb2o1RkRBVnorSXYvZXREMlFB?=
 =?utf-8?B?MUdmUFRwcmYzNmlVQStJTWxTMzVZU2xuQTQ4VEx5cXlCbjZqY0RGc0VzbFBX?=
 =?utf-8?B?OWRzVXdnRkkzOWgyUHBwSllrM1pkRmRPTmN0WW1ZU0dlUkxjQ1VUSFMyZXlm?=
 =?utf-8?B?bnVvQWtCT1hFUTNScFZ2V2hlU3cwYXg4WEg4MlljL21UYWNYV0hMVVl1dlho?=
 =?utf-8?B?dEgwUlcwYkFmRk93aEVtaDZkV3gwVHArRFFCOWtBenY1N3BpQTdwdEEvRUZE?=
 =?utf-8?B?eVQ2b2p0em5KdDFkUXlGUmY4dklLL2NQWkpNanlGRjRrVU54a2l0a2taaDk2?=
 =?utf-8?B?cXRhaktYNGNuUS9OQU9QWnNvVWxuNzZyZ1dhVXFvOE5EMWtPeUdRZXAvS0Yv?=
 =?utf-8?B?SnpNenNZdGF4Q0tmSjQyTnNmbVE3dWltM05RU0M1QWRva3d1T2lxV2VJZDZh?=
 =?utf-8?B?bnhlVkxsWGs0UDZsbFg0ekdSeERjVWk3Zjg0a3I1Z003bDRUSUZPdjBtc3Vo?=
 =?utf-8?B?YjhBYXNOWmdOc3RlOXVXczA3VjRwUnE2TWNCUzZkSGNXK1k4eUNnMVFqWmlR?=
 =?utf-8?B?ZTVBU1hreDJXaFJTNlhMcmVhYW5WK2dlL2RzSW5xSEJueTl3L3J5Nng4TEtG?=
 =?utf-8?B?ZEIxYm80bkdOVTFQUExLUXp0ZWVkVzdmMW1KWXNtZHBmcGV0RzZGckhuWDUx?=
 =?utf-8?B?TDVDV3VzKzFVTWpPbnFtTTdobjFqMVVRYmYrd0JGUFhkUCtGVkJzWHdwclZa?=
 =?utf-8?B?L3d1Q2JIT0txbmJDc3RuKzM2YndqZEI5NW1vSVgxb0FUcmdxSlI0S3IySlpO?=
 =?utf-8?B?RnBqMC85TWVqMU5yRENiK2xDOGxVRGtqTVdJU0xjdFRUdG1DS05hSTFmcDNP?=
 =?utf-8?B?VTJSdTFyREZGRjgzQTFzaXBnSllXSjVDbVlBNHdXaGYzWUFlNkw1aWRReHJL?=
 =?utf-8?B?c043SVJJeXNmL1VLaHZHU3AyOFRtMGd4MEprMXFIWGFHa2VSSzd0N2xCM3hE?=
 =?utf-8?B?Y0luNmxVQXRUMTdJK3QzUkVaRUZMUWdMMi96M0I0Mm4wRDl0Q25ZWGgvUFo1?=
 =?utf-8?B?NEkxRE5XN1U5MU13S1l6Y1pVM0dweDQxZy82V0NDL1RWNFo2L1N5akpwUEFp?=
 =?utf-8?B?VWZTV2xlNGlqUzEwaGRqVjRLM1gyVnF2UUJBb3JzZC9PMC9EZFVUY1Y4R1lK?=
 =?utf-8?B?VDg5WGh1dWE1TXZDbHZDVkwyTFZMQjU4dnRzbjY2dDNjZjgyZ0R6N0ticEFT?=
 =?utf-8?B?eEFrQ1B1L01sc3BNd2FGUmtUUklHa3E0bnErekJxV0t0ZHJLdTU1Uy9rbXJo?=
 =?utf-8?B?c2xnZUlpeEhsVmhnaGpzQTN3WGx2THRsWmFqM0EvaWFpdlpZZ0R5ZS9BUk1h?=
 =?utf-8?B?Y2g0TGQrS1JmZlRwdTYrSFk3VGFPRVVSRTIvazNRTlVkMGtkdVdYcnBEVHA1?=
 =?utf-8?B?MW9TZkdYN2t5NG03TmtzSVRtc01jQmNPcVZnMjU1aGk4SVBuZ2xxdW5VSVN1?=
 =?utf-8?B?SFFRYVVCaVFVK0NZVUw5aFdLdnNwN0NnNFhlOWhpQkFGcWUvVXRwazFMZjhD?=
 =?utf-8?B?anFtNWNKdFBGTEVaL0pFbEZGejlWMUNVbi9BOTcyempOSVJyLzVySkFRZWt0?=
 =?utf-8?B?a0lVL2tZMWNCM3RGdGRETWV2WFRNT2twQVFFZFFOYkEwRUFwTGxwM2gzRVZa?=
 =?utf-8?B?WmNOR01ndUxLSDA0WTZOMkhhV3JwL2hBcE56eDJtdkVBOGdZVzdkblFmMUpi?=
 =?utf-8?B?cEQ4bTFwUDBEbHdEdHpVbXUxUk9TUWl2dDQ0dzdPVXBEZzBLbjdNVk5FMnd1?=
 =?utf-8?B?SmJTcHRiVjdJZTlFaXh0RFZ0OGxkKzJlbUhNajNSRFhZUGdhVUluaFNsenhv?=
 =?utf-8?B?dUFTcS9sUUJtMUljVWFrd0VLeVJqdnJoc1o3WXF0YWxKamQvejV6TFF1VWFR?=
 =?utf-8?B?elJjVWsxUzVrcGNnL29LUzhxN2ZlejZLbjIyMmRrbmZEb2lKYmNxekhnSFl2?=
 =?utf-8?Q?0PJ60yUzD6VxImelr8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e88231-fc9b-4a9f-8c13-08da109116ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 08:00:56.3721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JNwPrslMmICm1yZjQaM0YhY65evaWFOIyjEWQE05w1tC96WbQt3goJCA2msNzdu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KRGVhciBQYXVsIGFuZCBUYW8sDQoNCkNvbW1lbnRz
IGFyZSBhZGRlZCBpbmxpbmUuDQoNClJlZ2FyZHMsDQpaYWZhcg0KDQo+LS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj5Gcm9tOiBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPg0K
PlNlbnQ6IE1vbmRheSwgTWFyY2ggMjgsIDIwMjIgMToyMiBQTQ0KPlRvOiBaaG91MSwgVGFvIDxU
YW8uWmhvdTFAYW1kLmNvbT47IFppeWEsIE1vaGFtbWFkIHphZmFyDQo+PE1vaGFtbWFkemFmYXIu
Wml5YUBhbWQuY29tPg0KPkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTGF6YXIs
IExpam8gPExpam8uTGF6YXJAYW1kLmNvbT47IFpoYW5nLA0KPkhhd2tpbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIIHY0IDUvNl0gZHJtL2FtZGdwdS92Y246
IFZDTiByYXMgZXJyb3IgcXVlcnkgc3VwcG9ydA0KPg0KPkRlYXIgTW9oYW1tYWQsIGRlYXIgVGFv
LA0KPg0KPg0KPlRhbywgaXTigJlzIGhhcmQgdG8gZmluZCB5b3VyIHJlcGx5IGluIHRoZSBxdW90
ZSwgYXMgdGhlIG1lc3NhZ2UgaXMgbm90IHF1b3RlZA0KPmNvcnJlY3RseSAoPiBwcmVwZW5kZWQp
LiBJcyBpdCBwb3NzaWJsZSB0byB1c2UgYSBkaWZmZXJlbnQgZW1haWwgY2xpZW50Pw0KPg0KPg0K
PkFtIDI4LjAzLjIyIHVtIDA5OjQzIHNjaHJpZWIgWmhvdTEsIFRhbzoNCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiBaaXlhLCBNb2hhbW1hZCB6YWZhciA8TW9oYW1tYWR6
YWZhci5aaXlhQGFtZC5jb20+DQo+PiBTZW50OiBNb25kYXksIE1hcmNoIDI4LCAyMDIyIDI6MjUg
UE0NCj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gQ2M6IExhemFyLCBM
aWpvIDxMaWpvLkxhemFyQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47
DQo+PiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWml5YSwgTW9oYW1t
YWQgemFmYXINCj4+IDxNb2hhbW1hZHphZmFyLlppeWFAYW1kLmNvbT4NCj4+IFN1YmplY3Q6IFtQ
QVRDSCB2NCA1LzZdIGRybS9hbWRncHUvdmNuOiBWQ04gcmFzIGVycm9yIHF1ZXJ5IHN1cHBvcnQN
Cj4+DQo+PiBSQVMgZXJyb3IgcXVlcnkgc3VwcG9ydCBhZGRpdGlvbiBmb3IgVkNOIDIuNg0KPj4N
Cj4+IFYyOiByZW1vdmVkIHVudXNlZCBvcHRpb24gYW5kIGNvcnJlY3RlZCBjb21tZW50IGZvcm1h
dCBNb3ZlZCB0aGUNCj4+IHJlZ2lzdGVyIGRlZmluaXRpb24gdW5kZXIgaGVhZGVyIGZpbGUNCj4N
Cj5QbGVhc2Ugd3JhcCBsaW5lcyBhZnRlciA3NSBjaGFyYWN0ZXJzLiAoYHNjcmlwdHMvY2hlY2tw
YXRjaC5wbGAgc2hvdWxkIGhhdmUNCj53YXJuZWQgeW91IGFib3V0IHRoYXQpLg0KPg0KPj4gVjM6
IHBvaXNvbiBxdWVyeSBzdGF0dXMgY2hlY2sgYWRkZWQuDQo+PiBSZW1vdmVkIGVycm9yIHF1ZXJ5
IGludGVyZmFjZQ0KPj4NCj4+IFY0OiBNTVNDSCBwb2lzb24gY2hlY2sgb3B0aW9uIHJlbW92ZWQs
IHJldHVybiB0cnVlL2ZhbHNlIHJlZmFjdG9yZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTW9o
YW1tYWQgWmFmYXIgWml5YSA8TW9oYW1tYWR6YWZhci56aXlhQGFtZC5jb20+DQo+PiBSZXZpZXdl
ZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPj4gLS0tDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8ICAxICsNCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyAgIHwgNzENCj4rKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81Lmgg
ICB8ICA2ICsrKw0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKykNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaA0KPj4gaW5kZXggMWUx
YTNiNzM2ODU5Li42MDZkZjg4NjliODkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuaA0KPj4gQEAgLTUwOCw2ICs1MDgsNyBAQCBzdHJ1Y3QgYW1kZ3B1X3Jh
c19ibG9ja19od19vcHMgew0KPj4gICAJdm9pZCAoKnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdm9pZA0KPipyYXNfZXJyb3Jfc3RhdHVzKTsNCj4+
ICAgCXZvaWQgKCpyZXNldF9yYXNfZXJyb3JfY291bnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsNCj4+ICAgCXZvaWQgKCpyZXNldF9yYXNfZXJyb3Jfc3RhdHVzKShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldik7DQo+PiArCWJvb2wgKCpxdWVyeV9wb2lzb25fc3RhdHVzKShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7DQo+PiAgIH07DQo+Pg0KPj4gICAvKiB3b3JrIGZsb3cNCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+PiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMNCj4+IGluZGV4IDE4NjliYWU0
MTA0Yi4uMzk4OGZjNjQ3NzQxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzUuYw0KPj4gQEAgLTMxLDYgKzMxLDcgQEANCj4+ICAgI2luY2x1ZGUgInNvYzE1ZC5oIg0K
Pj4gICAjaW5jbHVkZSAidmNuX3YyXzAuaCINCj4+ICAgI2luY2x1ZGUgIm1tc2NoX3YxXzAuaCIN
Cj4+ICsjaW5jbHVkZSAidmNuX3YyXzUuaCINCj4+DQo+PiAgICNpbmNsdWRlICJ2Y24vdmNuXzJf
NV9vZmZzZXQuaCINCj4+ICAgI2luY2x1ZGUgInZjbi92Y25fMl81X3NoX21hc2suaCINCj4+IEBA
IC01OSw2ICs2MCw3IEBAIHN0YXRpYyBpbnQgdmNuX3YyXzVfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRl
KHZvaWQNCj4qaGFuZGxlLCAgc3RhdGljIGludCB2Y25fdjJfNV9wYXVzZV9kcGdfbW9kZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZQ0KPiphZGV2LA0KPj4gICAJCQkJaW50IGluc3RfaWR4LCBzdHJ1Y3Qg
ZHBnX3BhdXNlX3N0YXRlDQo+Km5ld19zdGF0ZSk7ICBzdGF0aWMgaW50DQo+PiB2Y25fdjJfNV9z
cmlvdl9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+PiArc3RhdGljIHZvaWQg
dmNuX3YyXzVfc2V0X3Jhc19mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+Pg0K
Pj4gICBzdGF0aWMgaW50IGFtZGdwdV9paF9jbGllbnRpZF92Y25zW10gPSB7DQo+PiAgIAlTT0Mx
NV9JSF9DTElFTlRJRF9WQ04sDQo+PiBAQCAtMTAwLDYgKzEwMiw3IEBAIHN0YXRpYyBpbnQgdmNu
X3YyXzVfZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpDQo+PiAgIAl2Y25fdjJfNV9zZXRfZGVjX3Jp
bmdfZnVuY3MoYWRldik7DQo+PiAgIAl2Y25fdjJfNV9zZXRfZW5jX3JpbmdfZnVuY3MoYWRldik7
DQo+PiAgIAl2Y25fdjJfNV9zZXRfaXJxX2Z1bmNzKGFkZXYpOw0KPj4gKwl2Y25fdjJfNV9zZXRf
cmFzX2Z1bmNzKGFkZXYpOw0KPj4NCj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiBAQCAtMTkz
MCwzICsxOTMzLDcxIEBAIGNvbnN0IHN0cnVjdCBhbWRncHVfaXBfYmxvY2tfdmVyc2lvbg0KPnZj
bl92Ml82X2lwX2Jsb2NrID0NCj4+ICAgCQkucmV2ID0gMCwNCj4+ICAgCQkuZnVuY3MgPSAmdmNu
X3YyXzZfaXBfZnVuY3MsDQo+PiAgIH07DQo+PiArDQo+PiArc3RhdGljIHVpbnQzMl90IHZjbl92
Ml82X3F1ZXJ5X3BvaXNvbl9ieV9pbnN0YW5jZShzdHJ1Y3QNCj5hbWRncHVfZGV2aWNlICphZGV2
LA0KPj4gKwkJCXVpbnQzMl90IGluc3RhbmNlLCB1aW50MzJfdCBzdWJfYmxvY2spIHsNCj4+ICsJ
dWludDMyX3QgcG9pc29uX3N0YXQgPSAwLCByZWdfdmFsdWUgPSAwOw0KPj4gKw0KPj4gKwlzd2l0
Y2ggKHN1Yl9ibG9jaykgew0KPj4gKwljYXNlIEFNREdQVV9WQ05fVjJfNl9WQ1BVX1ZDT0RFQzoN
Cj4+ICsJCXJlZ192YWx1ZSA9IFJSRUczMl9TT0MxNShWQ04sIGluc3RhbmNlLA0KPm1tVVZEX1JB
U19WQ1BVX1ZDT0RFQ19TVEFUVVMpOw0KPj4gKwkJcG9pc29uX3N0YXQgPSBSRUdfR0VUX0ZJRUxE
KHJlZ192YWx1ZSwNCj5VVkRfUkFTX1ZDUFVfVkNPREVDX1NUQVRVUywgUE9JU09ORURfUEYpOw0K
Pj4gKwkJYnJlYWs7DQo+PiArCWRlZmF1bHQ6DQo+PiArCQlicmVhazsNCj4+ICsJfTsNCj4+ICsN
Cj4+ICsJaWYgKHBvaXNvbl9zdGF0KQ0KPj4gKwkJZGV2X2luZm8oYWRldi0+ZGV2LCAiUG9pc29u
IGRldGVjdGVkIGluIFZDTiVkLA0KPnN1Yl9ibG9jayVkXG4iLA0KPj4gKwkJCWluc3RhbmNlLCBz
dWJfYmxvY2spOw0KPg0KPldoYXQgc2hvdWxkIGEgdXNlciBkbyB3aXRoIHRoYXQgaW5mb3JtYXRp
b24/IEZhdWx0eSBoYXJkd2FyZSwg4oCmPw0KDQpbTW9oYW1tYWRdOiBUaGlzIG1lc3NhZ2Ugd2ls
bCBoZWxwIHRvIGlkZW50aWZ5IHRoZSBmYXVsdHkgaGFyZHdhcmUsIHRoZSBoYXJkd2FyZSBJRCB3
aWxsIGFsc28gbG9nIGFsb25nIHdpdGggcG9pc29uLCBoZWxwIHRvIGlkZW50aWZ5IGFtb25nIG11
bHRpcGxlIGhhcmR3YXJlIGluc3RhbGxlZCBvbiB0aGUgc3lzdGVtLg0KDQo+DQo+PiArDQo+PiAr
CXJldHVybiBwb2lzb25fc3RhdDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGJvb2wgdmNuX3Yy
XzZfcXVlcnlfcG9pc29uX3N0YXR1cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KPj4g
Kwl1aW50MzJfdCBpbnN0LCBzdWI7DQo+PiArCXVpbnQzMl90IHBvaXNvbl9zdGF0ID0gMDsNCj4+
ICsNCj4+ICsJZm9yIChpbnN0ID0gMDsgaW5zdCA8IGFkZXYtPnZjbi5udW1fdmNuX2luc3Q7IGlu
c3QrKykNCj4+ICsJCWZvciAoc3ViID0gMDsgc3ViIDwgQU1ER1BVX1ZDTl9WMl82X01BWF9TVUJf
QkxPQ0s7DQo+c3ViKyspDQo+PiArCQkJcG9pc29uX3N0YXQgKz0NCj4+ICsJCQl2Y25fdjJfNl9x
dWVyeV9wb2lzb25fYnlfaW5zdGFuY2UoYWRldiwgaW5zdCwNCj5zdWIpOw0KPj4gKw0KPj4gKwly
ZXR1cm4gcG9pc29uX3N0YXQgPyB0cnVlIDogZmFsc2U7DQo+Pg0KPj4gW1Rhb10ganVzdCB3YW50
IHRvIGNvbmZpcm0gdGhlIGxvZ2ljLCBpZiB0aGUgUE9JU09ORURfUEYgb2Ygb25lIGluc3RhbmNl
IGlzIDENCj5hbmQgYW5vdGhlciBpcyAwLCB0aGUgcG9pc29uX3N0YXQgaXMgdHJ1ZSwgY29ycmVj
dD8NCj4+IENhbiB3ZSBhZGQgYSBwcmludCBtZXNzYWdlIGZvciB0aGlzIGNhc2U/IFNhbWUgcXVl
c3Rpb24gdG8gSlBFRy4NCg0KW01vaGFtbWFkXTogTWVzc2FnZSB3aWxsIGJlIHByaW50ZWQgb24g
ZnVuY3Rpb24gYmxvY2sgYWhlYWQgb2YgdGhlIGZ1bmN0aW9uLg0KDQo+DQo+SXMgdGhlIGBkZXZf
aW5mb2AgbWVzc2FnZSBpbiBgdmNuX3YyXzZfcXVlcnlfcG9pc29uX2J5X2luc3RhbmNlKClgIGRv
aW5nDQo+d2hhdCB5b3Ugd2FudD8NCj4NCj5BbHNvLCBpbnN0ZWFkIG9mIGBwb2lzb25fc3RhdCA/
IHRydWUgOiBmYWxzZTtgIGEgY29tbW9uIHBhdHRlcm4gaXMNCj5gISFwb2lzb25fc3RhdGAgSSBi
ZWxpZXZlLg0KPg0KPg0KPktpbmQgcmVnYXJkcywNCj4NCj5QYXVsDQoNCltNb2hhbW1hZF06IE5v
dGVkIHRoZSBjaGFuZ2UuIFdpbGwgbWFrZSB0byByZXR1cm4gISFwb2lzb25fc3RhdCA/IHRydWUg
OiBmYWxzZTsNCg0KPg0KPg0KPj4gK30NCj4+ICsNCj4+ICtjb25zdCBzdHJ1Y3QgYW1kZ3B1X3Jh
c19ibG9ja19od19vcHMgdmNuX3YyXzZfcmFzX2h3X29wcyA9IHsNCj4+ICsJLnF1ZXJ5X3BvaXNv
bl9zdGF0dXMgPSB2Y25fdjJfNl9xdWVyeV9wb2lzb25fc3RhdHVzLCB9Ow0KPj4gKw0KPj4gK3N0
YXRpYyBzdHJ1Y3QgYW1kZ3B1X3Zjbl9yYXMgdmNuX3YyXzZfcmFzID0gew0KPj4gKwkucmFzX2Js
b2NrID0gew0KPj4gKwkJLmh3X29wcyA9ICZ2Y25fdjJfNl9yYXNfaHdfb3BzLA0KPj4gKwl9LA0K
Pj4gK307DQo+PiArDQo+PiArc3RhdGljIHZvaWQgdmNuX3YyXzVfc2V0X3Jhc19mdW5jcyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgew0KPj4gKwlzd2l0Y2ggKGFkZXYtPmlwX3ZlcnNpb25z
W1ZDTl9IV0lQXVswXSkgew0KPj4gKwljYXNlIElQX1ZFUlNJT04oMiwgNiwgMCk6DQo+PiArCQlh
ZGV2LT52Y24ucmFzID0gJnZjbl92Ml82X3JhczsNCj4+ICsJCWJyZWFrOw0KPj4gKwlkZWZhdWx0
Og0KPj4gKwkJYnJlYWs7DQo+PiArCX0NCj4+ICsNCj4+ICsJaWYgKGFkZXYtPnZjbi5yYXMpIHsN
Cj4+ICsJCWFtZGdwdV9yYXNfcmVnaXN0ZXJfcmFzX2Jsb2NrKGFkZXYsICZhZGV2LT52Y24ucmFz
LQ0KPj5yYXNfYmxvY2spOw0KPj4gKw0KPj4gKwkJc3RyY3B5KGFkZXYtPnZjbi5yYXMtPnJhc19i
bG9jay5yYXNfY29tbS5uYW1lLCAidmNuIik7DQo+PiArCQlhZGV2LT52Y24ucmFzLT5yYXNfYmxv
Y2sucmFzX2NvbW0uYmxvY2sgPQ0KPkFNREdQVV9SQVNfQkxPQ0tfX1ZDTjsNCj4+ICsJCWFkZXYt
PnZjbi5yYXMtPnJhc19ibG9jay5yYXNfY29tbS50eXBlID0NCj5BTURHUFVfUkFTX0VSUk9SX19Q
T0lTT047DQo+PiArCQlhZGV2LT52Y24ucmFzX2lmID0gJmFkZXYtPnZjbi5yYXMtPnJhc19ibG9j
ay5yYXNfY29tbTsNCj4+ICsNCj4+ICsJCS8qIElmIGRvbid0IGRlZmluZSBzcGVjaWFsIHJhc19s
YXRlX2luaXQgZnVuY3Rpb24sIHVzZSBkZWZhdWx0DQo+cmFzX2xhdGVfaW5pdCAqLw0KPj4gKwkJ
aWYgKCFhZGV2LT52Y24ucmFzLT5yYXNfYmxvY2sucmFzX2xhdGVfaW5pdCkNCj4+ICsJCQlhZGV2
LT52Y24ucmFzLT5yYXNfYmxvY2sucmFzX2xhdGVfaW5pdCA9DQo+YW1kZ3B1X3Jhc19ibG9ja19s
YXRlX2luaXQ7DQo+PiArCX0NCj4+ICt9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvdmNuX3YyXzUuaA0KPmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzUuaA0KPj4gaW5kZXggZTcyZjc5OWVkMGZkLi4xYzE5YWY3NGU0ZmQgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5oDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5oDQo+PiBAQCAtMjQsNiArMjQsMTIgQEAN
Cj4+ICAgI2lmbmRlZiBfX1ZDTl9WMl81X0hfXw0KPj4gICAjZGVmaW5lIF9fVkNOX1YyXzVfSF9f
DQo+Pg0KPj4gK2VudW0gYW1kZ3B1X3Zjbl92Ml82X3N1Yl9ibG9jayB7DQo+PiArCUFNREdQVV9W
Q05fVjJfNl9WQ1BVX1ZDT0RFQyA9IDAsDQo+PiArDQo+PiArCUFNREdQVV9WQ05fVjJfNl9NQVhf
U1VCX0JMT0NLLA0KPj4gK307DQo+PiArDQo+PiAgIGV4dGVybiBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2lwX2Jsb2NrX3ZlcnNpb24gdmNuX3YyXzVfaXBfYmxvY2s7ICBleHRlcm4NCj5jb25zdCBzdHJ1
Y3QgYW1kZ3B1X2lwX2Jsb2NrX3ZlcnNpb24gdmNuX3YyXzZfaXBfYmxvY2s7DQo+Pg0KPj4gLS0N
Cj4+IDIuMjUuMQ0K
