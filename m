Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416D86CD317
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Mar 2023 09:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CE910E4F3;
	Wed, 29 Mar 2023 07:25:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663410E4F3
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Mar 2023 07:25:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D40TQtIZFhOvP4V+EZOmXt6XTaiBewx+E/TV9OFMdRrcoRe414KeQNHZHYwhwExaY/Yt48Bf4+2wrgoas9JsxI6klKS7wjvg0XqfEr/4zskL4kq8CNVNwJtMncVsYqoZWN1otE+Y7A7Hu6sZbhHclDzOZCYgupTqu3CmE7Zc63PPWjrePVR5zEg1aC4+s5al4ejOVNFgxnAtFUZjs6eWbG2iv8gexJHhAscm6HnOgUoGWpuHt/hhQdbq59TZL8V60i86Mz3Qei5/qTg004gyjEJfJB4w6ivfo71MLsAlnHSxsWyN8My0x4iaDmqnvW+sZpU4jGoMynRVKe0m1VT5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2M7k6EZPOt8yxCyNsM6xrtrQ6zQH6Mk12fE28NOkfY=;
 b=Mz+BrHPtF9MRN3QWyHEv6aMCeVhpMk22xQS5UODQRjj426NflKmFA5K6YHReo/K/Bp+9X7u0l+75bC1DjCu0h/Y4jshlRYaeil08IpxiDOtgYIqBVnkzRAO0qfvwygPWf3GT3oFep84nCXDVsX7sn4sVcGjMR1FEDpLYV2FlgFoyvVdahCRdHoTBL89zPXJdFugWfBZNz2hUCELZMHikW440zgZMPDuKQrofT03WRiKIvKnuNzwM488Dv0VkLKJVpzDwRsw3ldeVGCaHAXlFHK1zNMfyK7SAW3sc4nJCJoiRSZbXvAHlc6Ay3en1CFtcGpUp2C6Rfa5Yk+jzj76vbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2M7k6EZPOt8yxCyNsM6xrtrQ6zQH6Mk12fE28NOkfY=;
 b=wk8J6b60krpy+NsAxUVbwM7rSCTO5Qlqd7wj9pTL22+wgHD+S2uZU88ANq2rvFv7NJSIy/Bzx6R4BrBej/BDD6GvFzNsZaiXLOPx+0kWIYGGJgrutP1wnSaZOSaJe+b9cKjkRFmjQCNuGBy9mtDGGNqRTJTTLTm8s/CSKQiwMI0=
Received: from BYAPR12MB3527.namprd12.prod.outlook.com (2603:10b6:a03:13c::12)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 07:25:41 +0000
Received: from BYAPR12MB3527.namprd12.prod.outlook.com
 ([fe80::1cfe:18af:21d3:923a]) by BYAPR12MB3527.namprd12.prod.outlook.com
 ([fe80::1cfe:18af:21d3:923a%7]) with mapi id 15.20.6178.038; Wed, 29 Mar 2023
 07:25:41 +0000
From: "Yang, WenYou" <WenYou.Yang@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "bp@suse.de" <bp@suse.de>,
 "peterz@infradead.org" <peterz@infradead.org>, "jpoimboe@kernel.org"
 <jpoimboe@kernel.org>, "Phillips, Kim" <kim.phillips@amd.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: RE: [PATCH v3 2/2] drm/amd/pm: vangogh: send the SMT enable message
 to pmfw
Thread-Topic: [PATCH v3 2/2] drm/amd/pm: vangogh: send the SMT enable message
 to pmfw
Thread-Index: AQHZYeEVaSgz4xgwZkGmfy56GZJuK68RR/IAgAATbUA=
Date: Wed, 29 Mar 2023 07:25:41 +0000
Message-ID: <BYAPR12MB3527CCF56A3C06EB51F05535FD899@BYAPR12MB3527.namprd12.prod.outlook.com>
References: <20230329015149.870132-1-WenYou.Yang@amd.com>
 <20230329015149.870132-3-WenYou.Yang@amd.com>
 <754c6d00-97fe-d53b-5a1d-eac11d718b03@amd.com>
In-Reply-To: <754c6d00-97fe-d53b-5a1d-eac11d718b03@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-29T07:25:37Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e61ed367-42d0-4646-a590-ef23ab352282;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3527:EE_|IA0PR12MB8975:EE_
x-ms-office365-filtering-correlation-id: 7bd709fc-ad68-4f67-0e76-08db3026cd4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFWCQjigWEzh5pJz3QY/VVtSGoYPLXoFdpzner8be3HC+q9EO++HVWtX/To+/h6SLyeo8kSjg8SpVcP6PPn2DMug57lSJGK4unvXCsaxKbsaGxJ+GE+r4trhfPWLEKAzpB2va5trBUbLcK6a5e8q//xkqKlyTVK70RB+Un4j5haIkTw5D5HaiiccDUsdVjmyyE6vm3yJN13/4HaSzfH2RnCReJMAz8jTAk2w0xcoLMhOslHfkWDj0D0+QqVlo123BRLUDzbFHmTxGul6ooLIclkwnMBLViNzSzvqx8WYoH9HFSV7pxf+TblGa1g6Iv+zlsG0Ijz1YjLlzP8ZWbrM50yNpc9pGZxo5ebKumF7iyyz0ZHHYz9mDX+VTtLvm6zikwM39V2SGophyybDJqu+7Exw+hNMaT+byvyySTq6AMoFHhUfgi4jT+6208hcLThlyVdbS+cV/AG7qygjKYVQZwt7g5sH0Pvkp3OKHcoYPVaaGKvtAvmawat/A9IA3io2Ufg3spjyTJ82jXJxik100medCVNM4Pr8turASEzJ+MbW/ppBfgXtbPjOR1xoiLNAqlcRGv9HsXgPKEZTlIo4jyoccrA2nxluBBizFRFH5fY6TOwOd9HOG5sHO/dQswDHWwUGpsj14+rpFpLO8xLrBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3527.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(71200400001)(478600001)(33656002)(83380400001)(186003)(53546011)(9686003)(55016003)(38100700002)(921005)(38070700005)(86362001)(122000001)(7696005)(26005)(6506007)(8676002)(76116006)(66446008)(66556008)(64756008)(4326008)(66946007)(66476007)(8936002)(52536014)(2906002)(41300700001)(15650500001)(54906003)(110136005)(316002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDZ1Q284Zld3a2xFZTB4NDlvWEdmTVROZWFwenFLVGduYXNaazl1cHBabzY2?=
 =?utf-8?B?RitRRFY1WVNQWi91TXE4N0ZHTjhkcGxXWWpUcjNodWx5bUtMUFJueGNuazJY?=
 =?utf-8?B?QmFzUkRYdTZXRXVxT3JSSEc1YTIzbUJINHVSeklidldHWW5sZ0lxRlNRaEpY?=
 =?utf-8?B?NVUyWmZjYy92amhEY1Jvc1hXM1Rpa2tpS2RhNGl4d3c3d08vWVlBZ3ZUc2Mz?=
 =?utf-8?B?TTZhZVdiRWJUWHhaaE5BNjI1L2FSL1UzeFUrUkY0ZU1pbStxQzZYNWNPeVkr?=
 =?utf-8?B?UFhEYURZU3lYVlViZ2UrYnl6WmtNaHF0eEswS3lqN1NEamkwbjZuWERrdVgv?=
 =?utf-8?B?Rk0wVFlRN0lsanRTL2QyYTFPbVZIVjNWbFRJdnVmOEhUZXNZZ29VT1ZmeFk0?=
 =?utf-8?B?VDllK0M5YWRFbG51dkZnTlIrNW5uMnBOd1JUWGp1cWp1NUZqR2ozYnQ0SDM2?=
 =?utf-8?B?ZDFkRlJ3WXJ4cTYzWjdBSzUxOW9Eb2dTV3JzaGVBZjVGb2Fwc2VFZEZsZGZl?=
 =?utf-8?B?bytPNjJUSUJrYTUyd1hUTE9WdUZjWDRPY0h2Mit2djk2TC9XdlZxT3JnRi9r?=
 =?utf-8?B?UnZYUWliUEc0eTErSFpkQW1lKzE5ZEpScFJPbjZVc0Z6cTlaQUpLMnk3K2tD?=
 =?utf-8?B?b3BSbVhIWVkydEtadkNLZkhFVU5mM0R3NlNGQlU3YjdyL2NDWFBWay83Nm85?=
 =?utf-8?B?VTh3Y2syRzFaRTRhMHFtZXEyVk5WUWgzV2pBSHJpc3ZSeGJQY0xWZSs3TGM5?=
 =?utf-8?B?ZFdmQWtGVmI5eVZiYXFDNktXSG9nQUhqeHVrR2RJM0FaMjhoR0g2aFpCeVU0?=
 =?utf-8?B?dmdNYzBoSkNlc2k0ZnE4QWpBVXhvdjJQSVd2WUNLZi9ENTJrbDE4N3RyeG1u?=
 =?utf-8?B?SHJCZndtR0lRUmFoN2VjOUpHSndQaUFMZ2NndDZYZStUVU4yeURZVzdxMVdM?=
 =?utf-8?B?RjJsdXI1RWxRc0JNTEdnb2hQTVMxN29UNlVXN3pDTlVkeVFwRmg1eXhpUjJL?=
 =?utf-8?B?RFpnUXNIalZSWE05MGxnSWR4RWp5WXBCaGwzbityVTdKUFh1dWpCcFdtajgy?=
 =?utf-8?B?SW5oa1FFdXNvRUFKUWt1eCtTRWY2ZjgwV0doSlBLTG9QOGQvSFNQRXp6bWtV?=
 =?utf-8?B?Um8rUkZPVWlpWVRBWmI3bUJ6K0trTUdBRGpPdE5ZZDkvbDNnWitnNjBmQ25J?=
 =?utf-8?B?SVRIWmVoM2I2RnM0dVp2SFdvOFVlRFZzRWFLVVgrQTJTMjcrYksvNUt3OFFC?=
 =?utf-8?B?d21Vc01LdHBwZ1BtMzlPTGxXSm5EZlVjWTNCOUFUN2lqRWZyNU1ySVhjbktL?=
 =?utf-8?B?N3VRQ0dWYnlOV2hta1dKZE0zRlZCM2szR3pra0NxMk5XeXM5Y1o0SGo3bkFh?=
 =?utf-8?B?TXlZRU16cU1CZExzZ3IwTTdaNFZ4Q25ka1gxVVdsd2EvVjB0VUZZRUVPOFJO?=
 =?utf-8?B?QWE2NGhSVUpweTE4ajcyTUJNWkw1OWJYQnUrczVyeEQ1Z21Zc2NWbm16YlVx?=
 =?utf-8?B?Q1MybVN1WmNsWFRFYzRrdG9uQ2N6ZG1LY1lkY3Ezd2VETHR4MHJ6R2pzZHdu?=
 =?utf-8?B?eHFrOWw3SXJvSjIyRU5NY3ZWYVVhb0pIcEtnZTQvcXFYN3IydFJYQ21BK0NE?=
 =?utf-8?B?aERiWUdzNkM1Z1g3M1hVTVYycnlNNm5GOFVHUThJWU5FeCtLN0Rta0EySEFz?=
 =?utf-8?B?QWVjUFQrWXQ2YnNDUVFzNUxnUDdnWDBhMG1vU29qc3IzcXlkUmZYVCtNSHQ4?=
 =?utf-8?B?MXl1aS90R21IelNObzVDU2Y3aXFMcXJvVzFnbngzTllBcTVuK28vSTZlT2xl?=
 =?utf-8?B?TWlENGdBazVjcDJidmRWakx4V2lnNmR5K2l4VWdqbHk5MkZHc0hjTjhNcEtB?=
 =?utf-8?B?cTNTREoxU3ZXNjF0Qjg4RkJwd2ZXSUhkdkZsVmw4SDZrVXAvbmt3M0krZ3Rx?=
 =?utf-8?B?TTI0bFFqMVVtOFgzcWlFUzFtVmQ0bVhPWG9OY3c5eVUxcTUzaFJ2b0NrODhw?=
 =?utf-8?B?TnArZjdnaGZSUHU3WCs0MVlRd1Z6aWlPak16dXJtQ2JmTDRvU3FGU1k0V1pt?=
 =?utf-8?B?NjJPSTlxaXBHK1pFRnpHZkU4NWZ5bnNpS0ZUdENoZ3A3UmIxNzY4R016U2hp?=
 =?utf-8?Q?Z+As=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3527.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd709fc-ad68-4f67-0e76-08db3026cd4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 07:25:41.3923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0WlbsZHlIVcKV/5d0fotLLbP0YMhaQ7UAjzfRfU60uyqd97bMvAqdwMl4uHNPv35C4B+Hd/UVcyoKySQ8W0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975
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
Cc: "Li, Ying" <YING.LI@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "gpiccoli@igalia.com" <gpiccoli@igalia.com>, "Yuan,
 Perry" <Perry.Yuan@amd.com>, "Liang, Richard qi" <Richardqi.Liang@amd.com>,
 "Liu, Kun" <Kun.Liu2@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IExhemFyLCBMaWpvIDxMaWpvLkxhemFyQGFtZC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMjksIDIwMjMgMjoxNSBQTQ0KPiBUbzogWWFuZywgV2Vu
WW91IDxXZW5Zb3UuWWFuZ0BhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBRdWFuLCBFdmFu
DQo+IDxFdmFuLlF1YW5AYW1kLmNvbT47IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGltb25j
aWVsbG9AYW1kLmNvbT47DQo+IGJwQHN1c2UuZGU7IHBldGVyekBpbmZyYWRlYWQub3JnOyBqcG9p
bWJvZUBrZXJuZWwub3JnOyBQaGlsbGlwcywgS2ltDQo+IDxraW0ucGhpbGxpcHNAYW1kLmNvbT47
IHRnbHhAbGludXRyb25peC5kZQ0KPiBDYzogWXVhbiwgUGVycnkgPFBlcnJ5Lll1YW5AYW1kLmNv
bT47IExpLCBZaW5nIDxZSU5HLkxJQGFtZC5jb20+OyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGdwaWNjb2xpQGlnYWxpYS5j
b207DQo+IExpdSwgS3VuIDxLdW4uTGl1MkBhbWQuY29tPjsgTGlhbmcsIFJpY2hhcmQgcWkgPFJp
Y2hhcmRxaS5MaWFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvMl0gZHJt
L2FtZC9wbTogdmFuZ29naDogc2VuZCB0aGUgU01UIGVuYWJsZQ0KPiBtZXNzYWdlIHRvIHBtZncN
Cj4gDQo+IA0KPiANCj4gT24gMy8yOS8yMDIzIDc6MjEgQU0sIFdlbnlvdSBZYW5nIHdyb3RlOg0K
PiA+IFdoZW4gdGhlIENQVSBTTVQgc3RhdHVzIGlzIGNoYW5nZWQgaW4gdGhlIGZseSwgc2VudCB0
aGUgU01UIGVuYWJsZQ0KPiA+IG1lc3NhZ2UgdG8gcG1mdyB0byBub3RpZnkgaXQgdGhhdCB0aGUg
U01UIHN0YXR1cyBjaGFuZ2VkLg0KPiA+DQo+ID4gQWRkIHRoZSBzdXBwb3J0IHRvIHNlbmQgUFBT
TUNfTVNHX1NldENDbGtTTVRFbmFibGUoMHg1OCkgbWVzc2FnZSB0bw0KPiA+IHBtZncgZm9yIHZh
bmdvZ2guDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZW55b3UgWWFuZyA8V2VuWW91LllhbmdA
YW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvYW1k
Z3B1X3NtdS5jICAgICB8ICA1ICsrKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3Nt
dS9pbmMvYW1kZ3B1X3NtdS5oIHwgIDcgKysrDQo+ID4gICAuLi4vcG0vc3dzbXUvaW5jL3BtZndf
aWYvc211X3YxMV81X3Bwc21jLmggICAgfCAgMyArLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9pbmMvc211X3R5cGVzLmggIHwgIDMgKy0NCj4gPiAgIC4uLi9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jICB8IDQzDQo+ICsrKysrKysrKysrKysrKysr
KysNCj4gPiAgIDUgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2Ft
ZGdwdV9zbXUuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9hbWRncHVfc211
LmMNCj4gPiBpbmRleCBiNWQ2NDc0OTk5MGUuLmQ1M2QyYWNjOWI0NiAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2FtZGdwdV9zbXUuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvYW1kZ3B1X3NtdS5jDQo+ID4gQEAgLTY5LDYgKzY5
LDggQEAgc3RhdGljIGludCBzbXVfc2V0X2Zhbl9zcGVlZF9ycG0odm9pZCAqaGFuZGxlLA0KPiB1
aW50MzJfdCBzcGVlZCk7DQo+ID4gICBzdGF0aWMgaW50IHNtdV9zZXRfZ2Z4X2NncGcoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZW5hYmxlZCk7DQo+ID4gICBzdGF0aWMgaW50IHNtdV9z
ZXRfbXAxX3N0YXRlKHZvaWQgKmhhbmRsZSwgZW51bSBwcF9tcDFfc3RhdGUNCj4gPiBtcDFfc3Rh
dGUpOw0KPiA+DQo+ID4gK2V4dGVybiBzdHJ1Y3QgcmF3X25vdGlmaWVyX2hlYWQgc210X25vdGlm
aWVyX2hlYWQ7DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCBzbXVfc3lzX2dldF9wcF9mZWF0dXJl
X21hc2sodm9pZCAqaGFuZGxlLA0KPiA+ICAgCQkJCSAgICAgICBjaGFyICpidWYpDQo+ID4gICB7
DQo+ID4gQEAgLTExMjIsNiArMTEyNCw5IEBAIHN0YXRpYyBpbnQgc211X3N3X2Zpbmkodm9pZCAq
aGFuZGxlKQ0KPiA+DQo+ID4gICAJc211X2ZpbmlfbWljcm9jb2RlKHNtdSk7DQo+ID4NCj4gPiAr
CWlmIChzbXUtPm5iLm5vdGlmaWVyX2NhbGwgIT0gTlVMTCkNCj4gPiArCQlyYXdfbm90aWZpZXJf
Y2hhaW5fdW5yZWdpc3Rlcigmc210X25vdGlmaWVyX2hlYWQsICZzbXUtPm5iKTsNCj4gPiArDQo+
ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9zd3NtdS9pbmMvYW1kZ3B1X3NtdS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3N3c211L2luYy9hbWRncHVfc211LmgNCj4gPiBpbmRleCAwOTQ2OWM3NTBhOTYu
LjRkNTFhYzVlYzhiYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3
c211L2luYy9hbWRncHVfc211LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3
c211L2luYy9hbWRncHVfc211LmgNCj4gPiBAQCAtNTY2LDYgKzU2Niw4IEBAIHN0cnVjdCBzbXVf
Y29udGV4dA0KPiA+DQo+ID4gICAJc3RydWN0IGZpcm13YXJlIHBwdGFibGVfZmlybXdhcmU7DQo+
ID4NCj4gPiArCXN0cnVjdCBub3RpZmllcl9ibG9jayBuYjsNCj4gPiArDQo+ID4gICAJdTMyIHBh
cmFtX3JlZzsNCj4gPiAgIAl1MzIgbXNnX3JlZzsNCj4gPiAgIAl1MzIgcmVzcF9yZWc7DQo+ID4g
QEAgLTEzNTQsNiArMTM1NiwxMSBAQCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyB7DQo+ID4gICAJICog
QGluaXRfcHB0YWJsZV9taWNyb2NvZGU6IFByZXBhcmUgdGhlIHBwdGFibGUgbWljcm9jb2RlIHRv
IHVwbG9hZA0KPiB2aWEgUFNQDQo+ID4gICAJICovDQo+ID4gICAJaW50ICgqaW5pdF9wcHRhYmxl
X21pY3JvY29kZSkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpOw0KPiA+ICsNCj4gPiArCS8qKg0K
PiA+ICsJICogQHNldF9jcHVfc210X2VuYWJsZTogU2V0IHRoZSBDUFUgU01UIHN0YXR1cy4NCj4g
PiArCSAqLw0KPiA+ICsJaW50ICgqc2V0X2NwdV9zbXRfZW5hYmxlKShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwgYm9vbCBzbXRfZW5hYmxlKTsNCj4gPiAgIH07DQo+ID4NCj4gPiAgIHR5cGVkZWYg
ZW51bSB7DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3Nt
dS9pbmMvcG1md19pZi9zbXVfdjExXzVfcHBzbWMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9pbmMvcG1md19pZi9zbXVfdjExXzVfcHBzbWMuaA0KPiA+IGluZGV4IDc0NzFl
MmRmMjgyOC4uYTZiZmExOTEyYzQyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vc3dzbXUvaW5jL3BtZndfaWYvc211X3YxMV81X3Bwc21jLmgNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2luYy9wbWZ3X2lmL3NtdV92MTFfNV9wcHNtYy5oDQo+
ID4gQEAgLTExMSw3ICsxMTEsOCBAQA0KPiA+ICAgI2RlZmluZSBQUFNNQ19NU0dfR2V0R2Z4T2Zm
U3RhdHVzCQkgICAgICAgMHg1MA0KPiA+ICAgI2RlZmluZSBQUFNNQ19NU0dfR2V0R2Z4T2ZmRW50
cnlDb3VudAkJICAgICAgIDB4NTENCj4gPiAgICNkZWZpbmUgUFBTTUNfTVNHX0xvZ0dmeE9mZlJl
c2lkZW5jeQkJICAgICAgIDB4NTINCj4gPiAtI2RlZmluZSBQUFNNQ19NZXNzYWdlX0NvdW50ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDB4NTMNCj4gPiArI2RlZmluZSBQUFNNQ19NU0dfU2V0
Q0Nsa1NNVEVuYWJsZQkJICAgICAgIDB4NTgNCj4gPiArI2RlZmluZSBQUFNNQ19NZXNzYWdlX0Nv
dW50ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4NTkNCj4gPg0KPiA+ICAgLy9Bcmd1bWVu
dCBmb3IgUFBTTUNfTVNHX0dmeERldmljZURyaXZlclJlc2V0DQo+ID4gICBlbnVtIHsNCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9pbmMvc211X3R5cGVzLmgN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvaW5jL3NtdV90eXBlcy5oDQo+ID4g
aW5kZXggMjk3YjcwYjkzODhmLi44MjA4MTJkOTEwYmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9pbmMvc211X3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL3N3c211L2luYy9zbXVfdHlwZXMuaA0KPiA+IEBAIC0yNDUsNyArMjQ1
LDggQEANCj4gPiAgIAlfX1NNVV9EVU1NWV9NQVAoQWxsb3dHcG8pLAlcDQo+ID4gICAJX19TTVVf
RFVNTVlfTUFQKE1vZGUyUmVzZXQpLAlcDQo+ID4gICAJX19TTVVfRFVNTVlfTUFQKFJlcXVlc3RJ
MmNUcmFuc2FjdGlvbiksIFwNCj4gPiAtCV9fU01VX0RVTU1ZX01BUChHZXRNZXRyaWNzVGFibGUp
LA0KPiA+ICsJX19TTVVfRFVNTVlfTUFQKEdldE1ldHJpY3NUYWJsZSksIFwNCj4gPiArCV9fU01V
X0RVTU1ZX01BUChTZXRDQ2xrU01URW5hYmxlKSwNCj4gPg0KPiA+ICAgI3VuZGVmIF9fU01VX0RV
TU1ZX01BUA0KPiA+ICAgI2RlZmluZSBfX1NNVV9EVU1NWV9NQVAodHlwZSkJU01VX01TR18jI3R5
cGUNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS92
YW5nb2doX3BwdC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3Zh
bmdvZ2hfcHB0LmMNCj4gPiBpbmRleCA3NDMzZGNhYTE2ZTAuLjA3Zjg4MjJmMmViMCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hf
cHB0LmMNCj4gPiBAQCAtMzUsNiArMzUsNyBAQA0KPiA+ICAgI2luY2x1ZGUgImFzaWNfcmVnL2dj
L2djXzEwXzNfMF9vZmZzZXQuaCINCj4gPiAgICNpbmNsdWRlICJhc2ljX3JlZy9nYy9nY18xMF8z
XzBfc2hfbWFzay5oIg0KPiA+ICAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2NwdS5oPg0KPiA+DQo+ID4gICAvKg0KPiA+ICAgICogRE8gTk9UIHVzZSB0
aGVzZSBmb3IgZXJyL3dhcm4vaW5mby9kZWJ1ZyBtZXNzYWdlcy4NCj4gPiBAQCAtNzAsNiArNzEs
OCBAQA0KPiA+ICAgCUZFQVRVUkVfTUFTSyhGRUFUVVJFX0RDRkNMS19EUE1fQklUKXwgXA0KPiA+
ICAgCUZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWF9EUE1fQklUKSkNCj4gPg0KPiA+ICtleHRlcm4g
c3RydWN0IHJhd19ub3RpZmllcl9oZWFkIHNtdF9ub3RpZmllcl9oZWFkOw0KPiA+ICsNCj4gPiAg
IHN0YXRpYyBzdHJ1Y3QgY21uMmFzaWNfbXNnX21hcHBpbmcNCj4gdmFuZ29naF9tZXNzYWdlX21h
cFtTTVVfTVNHX01BWF9DT1VOVF0gPSB7DQo+ID4gICAJTVNHX01BUChUZXN0TWVzc2FnZSwgICAg
ICAgICAgICAgICAgICAgIFBQU01DX01TR19UZXN0TWVzc2FnZSwNCj4gCQkwKSwNCj4gPiAgIAlN
U0dfTUFQKEdldFNtdVZlcnNpb24sICAgICAgICAgICAgICAgICAgUFBTTUNfTVNHX0dldFNtdVZl
cnNpb24sDQo+IAkJMCksDQo+ID4gQEAgLTE0MSw2ICsxNDQsNyBAQCBzdGF0aWMgc3RydWN0IGNt
bjJhc2ljX21zZ19tYXBwaW5nDQo+IHZhbmdvZ2hfbWVzc2FnZV9tYXBbU01VX01TR19NQVhfQ09V
TlRdID0gew0KPiA+ICAgCU1TR19NQVAoR2V0R2Z4T2ZmU3RhdHVzLA0KPiBQUFNNQ19NU0dfR2V0
R2Z4T2ZmU3RhdHVzLAkJCQkJCTApLA0KPiA+ICAgCU1TR19NQVAoR2V0R2Z4T2ZmRW50cnlDb3Vu
dCwNCj4gUFBTTUNfTVNHX0dldEdmeE9mZkVudHJ5Q291bnQsCQkJCQkwKSwNCj4gPiAgIAlNU0df
TUFQKExvZ0dmeE9mZlJlc2lkZW5jeSwNCj4gUFBTTUNfTVNHX0xvZ0dmeE9mZlJlc2lkZW5jeSwJ
CQkJCTApLA0KPiA+ICsJTVNHX01BUChTZXRDQ2xrU01URW5hYmxlLA0KPiBQUFNNQ19NU0dfU2V0
Q0Nsa1NNVEVuYWJsZSwNCj4gCTApLA0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RhdGljIHN0cnVj
dCBjbW4yYXNpY19tYXBwaW5nDQo+ID4gdmFuZ29naF9mZWF0dXJlX21hc2tfbWFwW1NNVV9GRUFU
VVJFX0NPVU5UXSA9IHsgQEAgLTIyMSw2ICsyMjUsOQ0KPiBAQCBzdGF0aWMgY29uc3QgdWludDhf
dCB2YW5nb2doX3Rocm90dGxlcl9tYXBbXSA9IHsNCj4gPiAgIAlbVEhST1RUTEVSX1NUQVRVU19C
SVRfVERDX0NWSVBdCT0NCj4gKFNNVV9USFJPVFRMRVJfVERDX0NWSVBfQklUKSwNCj4gPiAgIH07
DQo+ID4NCj4gPiArc3RhdGljIGludCBzbXRfbm90aWZpZXJfY2FsbGJhY2soc3RydWN0IG5vdGlm
aWVyX2Jsb2NrICpuYiwNCj4gPiArCQkJCSB1bnNpZ25lZCBsb25nIGFjdGlvbiwgdm9pZCAqZGF0
YSk7DQo+ID4gKw0KPiA+ICAgc3RhdGljIGludCB2YW5nb2doX3RhYmxlc19pbml0KHN0cnVjdCBz
bXVfY29udGV4dCAqc211KQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVjdCBzbXVfdGFibGVfY29udGV4
dCAqc211X3RhYmxlID0gJnNtdS0+c211X3RhYmxlOyBAQCAtNDc3LDYNCj4gPiArNDg0LDkgQEAg
c3RhdGljIGludCB2YW5nb2doX2luaXRfc21jX3RhYmxlcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSkNCj4gPiAgIAlzbXUtPmNwdV9jb3JlX251bSA9IDQ7DQo+ID4gICAjZW5kaWYNCj4gPg0KPiA+
ICsJc211LT5uYi5ub3RpZmllcl9jYWxsID0gc210X25vdGlmaWVyX2NhbGxiYWNrOw0KPiA+ICsJ
cmF3X25vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKCZzbXRfbm90aWZpZXJfaGVhZCwgJnNtdS0+bmIp
Ow0KPiA+ICsNCj4gPiAgIAlyZXR1cm4gc211X3YxMV8wX2luaXRfc21jX3RhYmxlcyhzbXUpOw0K
PiA+ICAgfQ0KPiA+DQo+ID4gQEAgLTI0MjgsNiArMjQzOCwxMiBAQCBzdGF0aWMgdTMyIHZhbmdv
Z2hfZ2V0X2dmeG9mZl9lbnRyeWNvdW50KHN0cnVjdA0KPiBzbXVfY29udGV4dCAqc211LCB1aW50
NjRfdCAqZW50cg0KPiA+ICAgCXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGlj
IGludCB2YW5nb2doX3NldF9jcHVfc210X2VuYWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
Ym9vbA0KPiA+ICtlbmFibGUpIHsNCj4gPiArCXJldHVybiBzbXVfY21uX3NlbmRfc21jX21zZ193
aXRoX3BhcmFtKHNtdSwNCj4gU01VX01TR19TZXRDQ2xrU01URW5hYmxlLA0KPiA+ICsJCQkJCSAg
ICAgICBlbmFibGUgPyAxIDogMCwgTlVMTCk7DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgdmFuZ29naF9wcHRfZnVuY3MgPSB7DQo+ID4NCj4g
PiAgIAkuY2hlY2tfZndfc3RhdHVzID0gc211X3YxMV8wX2NoZWNrX2Z3X3N0YXR1cywgQEAgLTI0
NzQsNiArMjQ5MCw3DQo+IEBADQo+ID4gc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNz
IHZhbmdvZ2hfcHB0X2Z1bmNzID0gew0KPiA+ICAgCS5nZXRfcG93ZXJfbGltaXQgPSB2YW5nb2do
X2dldF9wb3dlcl9saW1pdCwNCj4gPiAgIAkuc2V0X3Bvd2VyX2xpbWl0ID0gdmFuZ29naF9zZXRf
cG93ZXJfbGltaXQsDQo+ID4gICAJLmdldF92Ymlvc19ib290dXBfdmFsdWVzID0gc211X3YxMV8w
X2dldF92Ymlvc19ib290dXBfdmFsdWVzLA0KPiA+ICsJLnNldF9jcHVfc210X2VuYWJsZSA9IHZh
bmdvZ2hfc2V0X2NwdV9zbXRfZW5hYmxlLA0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgdm9pZCB2YW5n
b2doX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpIEBAIC0yNDg2LDMNCj4g
PiArMjUwMywyOSBAQCB2b2lkIHZhbmdvZ2hfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSkNCj4gPiAgIAlzbXUtPmlzX2FwdSA9IHRydWU7DQo+ID4gICAJc211X3YxMV8wX3Nl
dF9zbXVfbWFpbGJveF9yZWdpc3RlcnMoc211KTsNCj4gPiAgIH0NCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgc211X3NldF9jcHVfc210X2VuYWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9v
bA0KPiA+ICtlbmFibGUpIHsNCj4gPiArCWludCByZXQgPSAtRUlOVkFMOw0KPiA+ICsNCj4gPiAr
CWlmIChzbXUtPnBwdF9mdW5jcyAmJiBzbXUtPnBwdF9mdW5jcy0+c2V0X2NwdV9zbXRfZW5hYmxl
KQ0KPiA+ICsJCXJldCA9IHNtdS0+cHB0X2Z1bmNzLT5zZXRfY3B1X3NtdF9lbmFibGUoc211LCBl
bmFibGUpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0
YXRpYyBpbnQgc210X25vdGlmaWVyX2NhbGxiYWNrKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIs
DQo+ID4gKwkJCQkgdW5zaWduZWQgbG9uZyBhY3Rpb24sIHZvaWQgKmRhdGEpIHsNCj4gDQo+IFRo
aXMgYW5kIHRoZSBvbmUgYWJvdmUgY2FuIGJlIG1vdmVkIHRvIHNtdV9jbW4uYyBhcyB0aGV5IGFy
ZSBnZW5lcmljIG9uZXMuDQo+IA0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4gV2lsbCBkby4N
Cg0KQmVzdCBSZWdhcmRzLA0KV2VueW91DQoNCj4gVGhhbmtzLA0KPiBMaWpvDQo+IA0KPiA+ICsJ
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSBjb250YWluZXJfb2YobmIsIHN0cnVjdCBzbXVfY29u
dGV4dCwgbmIpOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlzbXUgPSBjb250YWluZXJf
b2YobmIsIHN0cnVjdCBzbXVfY29udGV4dCwgbmIpOw0KPiA+ICsNCj4gPiArCXJldCA9IHNtdV9z
ZXRfY3B1X3NtdF9lbmFibGUoc211LCBhY3Rpb24gPT0gU01UX0VOQUJMRUQpOw0KPiA+ICsNCj4g
PiArCWRldl9kYmcoc211LT5hZGV2LT5kZXYsICJmYWlsZWQgdG8gc2V0IGNjbGtfcGRfbGltaXQg
Zm9yDQo+IFNNVCAlc2FibGVkOiAlZFxuIiwNCj4gPiArCQlhY3Rpb24gPT0gU01UX0VOQUJMRUQg
PwkiZW4iIDogImRpcyIsIHJldCk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldCA/IE5PVElGWV9C
QUQgOiBOT1RJRllfT0s7IH0NCg==
