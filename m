Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29057FD68
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Jul 2022 12:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FF410FA6F;
	Mon, 25 Jul 2022 10:27:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC9F10FFD2;
 Mon, 25 Jul 2022 10:27:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVJ/3BsJALOw0OOiNt1a9XVkVjx7hQyZ2mkpUBRERogBLe8K8lairZ2o0znsoFk6AsO5e6egc/aH02mAhCiXKe780F1aHF3xMoHktjZykJVoeF3w3Syeilb+VXwgRkeSiaHVbZaOd3kIgHCMdm2yeOcL2V9asBDwNz0cJO28aMRkNpS6ujlrY8kjdZwaL37bia258Cj0lqIAR7HBKl8y7qbce2+OVIoYbkmmtrgdwbNX/rZ8l74birXhQAB2W+LyIxw6q4nDHi65t32wore/uUU0o3IFeUkhXsoWKnOjFkgkuRODHQx3eM00gZ4Z+3kcDB2GqhUCTJfzFIxd+MB0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPFr0WHbNgQr473vcFMJ2+5HdXgm9oFxrVFL+rwN2IA=;
 b=J8+Qu64Cbg68on555OBUwGrTqgMDnKJ11kekH53Y0LfOv2iwLbmC7PnSWEurkH97Kg6KruzrFJAPLroruSjzImRc6tD0fbfm5r7H2Xmcwqd4HBVOFtZ2PwIyYyw8aYXJngRw0EDxgleptTE/sbUXzurizvYSJNuy2LIr16+TS8CXi8C1Nl5huIrPme40wNe8asarMuIxjELk1OsxB35059VCbLLyHpyqtj+vxmCvaK0InNHuwPYm3ObpwvDn2I6T0WBsiKIXb8lezBarWPPFIJX/O0BEzljgNiC5uwERQZUYTEy3Y12g+GvjP/LJcUN9p6x8ZRlKQdaosdvsdz1Biw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPFr0WHbNgQr473vcFMJ2+5HdXgm9oFxrVFL+rwN2IA=;
 b=oDz8G/m3ZVJg/VqZpPtQP3VF7LbeeoEVryiG+GvPkNmQRnLTfjqgFT+SC9+Y79+jKotyL9lyz8V6BcBtC1JB6n7bfAr6AtJRIwmwk8aJXTfkRHeIPpDlXsK/vqlsRX/Qdwo6U6dbbA11hxgzxbMR+1t95REadCJgxaJ9fDEXw/I=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 MWHPR12MB1808.namprd12.prod.outlook.com (2603:10b6:300:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 10:27:09 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::4c95:9b06:87e6:4382]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::4c95:9b06:87e6:4382%7]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 10:27:09 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "StDenis, Tom"
 <Tom.StDenis@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Subject: RE: [PATCH 1/4] drm/amd: Add detailed GFXOFF stats to debugfs
Thread-Topic: [PATCH 1/4] drm/amd: Add detailed GFXOFF stats to debugfs
Thread-Index: AQHYngpyvnGyUl6Cw0q8L1OuzZCgM62O5aeA
Date: Mon, 25 Jul 2022 10:27:09 +0000
Message-ID: <DM6PR12MB26194D127DE749D0E8A37629E4959@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220722203347.70176-1-andrealmeid@igalia.com>
 <20220722203347.70176-2-andrealmeid@igalia.com>
In-Reply-To: <20220722203347.70176-2-andrealmeid@igalia.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-25T10:27:04Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7fed005b-dbee-4339-84d5-0f3ce8e2d113;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04acd149-a4c8-44a6-1cd6-08da6e283ae0
x-ms-traffictypediagnostic: MWHPR12MB1808:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U/KW1NSeHCqYq0tgDo3/BE3OMw5PpnJculd3ssmI1iMwD/DvWQ/dMlnfSeJCsEL1EDFK4fGNt0I4/aUyXC3Zvw5QhOBaNpcxe2WGWfokYkxVQ/ejWtAU20tyHKqKy7bpwVJfM6o1NlEiyh5BBLvnkWE1XLmY4G0a1EfTQAZtDuxnk90Q2+EHHjy39XA/xVLkQTOze6jfEQKIwBaqwDHay3vy3uxXHLU1lJ015O6OECbeq3nJFrEfyyb7m+P1gNhDC4NVs8HYr1eQWdzAlJdtXSly9tRz1Brn6palGpsAuSUSQZDt+7pyuPRwrJpYL241hxP8sVVLBKIej4GlXEqYixCDJblnqWFVTJOxW2Eu0j5zfrsIVnQ5yIAYrPCi1A9jbkxs2st1TTO1KuIOKAe5Qs5SCEbwJ8+BjLfWVj+owJ/PJJYqvTbRleNT4c09GgUP3mt+iPKSTa+3r+N6vXlq01koOzYV9RsbBtRwSf+S9dvevQB/wunTEJPPeyrRmcgKu68IwI01gG9ZA1Ba8m1UH6922QyBaaAnENVr3P67ssnwxcE53iiIADmaA9isKpsh7GlpXRHYx5coX3MMaaJJz4o/cCU1WP5WG9Ipo9RebiYXx+uDd+5eh/HobKBQu5lGnqI9JYriR23HqoKf8r/rB+4f4+NuVYO356l8ECaEL+HOPA2rbEFoenHHkzvAawuMCzB5Nljyhy8U8kt7rjTzRovAwtumQv2HP5yo3AgOiUaYg9vbtZwZ1ESkDZEOvhPrP2P5r546EEzY1IS6PEUw22GiqubZQSH3V3aOq5ETow1SjtT3mE0miuhUxQXZrx4fhQrOKU9ChvIJe0gxwO0L/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(316002)(6636002)(110136005)(83380400001)(26005)(33656002)(53546011)(6506007)(7696005)(9686003)(55016003)(41300700001)(71200400001)(478600001)(186003)(86362001)(5660300002)(52536014)(8936002)(2906002)(38070700005)(4326008)(921005)(30864003)(66946007)(64756008)(66556008)(66476007)(66446008)(8676002)(76116006)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzVoalRoRHhUV1BQczlvZlVyTURITm5Vb2wzUFB6SUhCUUh1cDNDM3ovSEFi?=
 =?utf-8?B?bEhjVVNPdUFkd0ZIKzE1RGJDalI4d1c3NlRsNWxqNnFrSGRoNEFQdGpSNWVa?=
 =?utf-8?B?cUJ1eVhLRWY0Nmk0WWljWmhQUFFBL1lCcE5vSmpIUFFaRmN6S1A5aUZ2WmxE?=
 =?utf-8?B?S2ZGQkUvcjFzRVgrSEtnQjNEVHl5RG9qdFE1T01Bd0k2eG1USGdHb0NReVZS?=
 =?utf-8?B?T3JIVE5JRERmL3orczV0L0pwVTlnanhRcS9uMTZKT0txd2xRN1c4SHd0R3Fs?=
 =?utf-8?B?YWh2b1BnN29YOUluSERPOTFDWTcrdVIyU0VjN1dYWkpvNnZNWEx5bHVNa1Zh?=
 =?utf-8?B?dGZKYkNCdGxlbzVpZEhESWtLeTFRQlNhV3BGTkdPQ0hLajNZVjhTcnlaSXVU?=
 =?utf-8?B?VnFob1hSQWVHZE1WN3R2SS9uZlRjS3pqNXQrL2pabkxEbUkzWjJYOEExL1cw?=
 =?utf-8?B?Z0ljSklpZkd6UXJsZ0t6M3pXTHlEVWlVcW9OSEg2ZmNoV2pqL053ejRtTDBS?=
 =?utf-8?B?bSt0S0VSUFVrTzRwVXQya3pXT0pyV0pNNVhUWXgzZW41S2xZQkdLQktJVzhT?=
 =?utf-8?B?UGhOUTY5YjFzcnZ5bmlhaDFTbWxrWUt3SkV3czRzdGIycTNaRi9EaDJ0dVNm?=
 =?utf-8?B?UVhRRngrV3JBR1dTejdvMlRiaHNVeHdZZE1kelFSbGVWcjJOVnFaaEhWTUdx?=
 =?utf-8?B?TlM3Y3lSa1R4b1h0SVlFNHkzMElPY2pHNFVXcTFoQXJ4c2Q3YVo1YUhtWnBF?=
 =?utf-8?B?anllYkUwVTdLQ0FWQk01UDNpbmpCdlpINWpyazFSdUxDcXdOVlNEMCtxZ2FI?=
 =?utf-8?B?czlCc2d6OWx4ZTBwMmVYOUl3SGM0emhQbEpMa2tuczhsb0sraUtEOUYrYlJz?=
 =?utf-8?B?NlN1clFuNWdQTU5YZGNMLzJzYWw2dnU0dnBwVVRJVm5qTmZoNG9hSk8xeEcw?=
 =?utf-8?B?elNuL1Fndko1WXp3TFpmOTlUOFhVOEFEMUZYOXNzemJ1RWxkTU1oRUZIcW9B?=
 =?utf-8?B?SHg5WjBJSFEwdFdncE05TXFGRDgvYU92WHQ4ZDcwUnZ1OE40NC9FcUk0Vk5s?=
 =?utf-8?B?T0ttajRqMVNSQ3hMYU4rbklvOXFEMUJVN2VaSExHQVBVWTRJVHVORWdSaXNB?=
 =?utf-8?B?eDl1L2VZeit4anNtUFhibzM1U3JjVklhNjdEMUc0Y1NXU1hYZk5tcDVhekJT?=
 =?utf-8?B?aHRkcWcwdFdEOTNPSVdzbmt2WFc0YzhISnJQQngrZEc2dUNMUjFibFptVEQ2?=
 =?utf-8?B?d01XMVl3M0lWbW15ZnROcnBFTWV2SjNRdGVMQ2N3blNPNHRiL2VFVFJiTHhY?=
 =?utf-8?B?dS9FTUVVT0FWMTFSL1dnNGJhdkxETUFnZ0tsamJKQnJ2a2RpNDcva21mMnFl?=
 =?utf-8?B?S216eEVGbXVXWDA2alNIL1JxOHdTc1hPRWFEQkFVWi81SnF4QWpVNXR3aVBk?=
 =?utf-8?B?aG5JTy94L3l5ZkV6bG42RHdJUmpaQkRVK2p3U2Y4c2dMZ1p5ODZSNTZFaHdK?=
 =?utf-8?B?Q3BrQ2hoZXl0LzQ2a2hwOG9XallWbG82UWlxV0JFbnB0S0xPTkJ6eXkrMnZz?=
 =?utf-8?B?K2dFYm1CZTAwNU10V1dwcGZBL2Q1MXh5Tzl1L1VtbTVyTXU3MDFXTlVzUE11?=
 =?utf-8?B?RVJuTkFIQit0K2JJcWRJeWR6SHkzM1dmbStkTlFEU1Vub05lTEFwSmpEY25H?=
 =?utf-8?B?UzRtYVZ0bU5IUk5uOVFlSGF6NVFET1J3ekZxS0ZrNG5IdWNWUU9QVVlaMjYv?=
 =?utf-8?B?Q2wxeE1MNzNERC9kd29admhXbGNUeExSby94UUkzOHdnY2JaWWN1STRtaDli?=
 =?utf-8?B?QjA3SUpIWmcxZjc0b1NiQkhrT3RBcmlxMHR6RjlqZzBCcFBBVU9rVWlVWFJy?=
 =?utf-8?B?K3k1QmZEUElISFBGMVZDQnJjZ0JPRW1KV09ocXVMTmJ1UUNwbWNSejFSMlBD?=
 =?utf-8?B?c2ptay9qK1FQbmtBSUNxWFdHbjFxT0RHSkVpYTFIZWtteTFNbWVMdU5xcXV1?=
 =?utf-8?B?QUU3R1QxREZsREh0d3l4R09hSUlyaFpLUFQwdU9WS2VWbVNiRjZYSHhCeGNa?=
 =?utf-8?B?UGVDak44dGdJaTZjbXIwRlE1MkJGdEVpdkM3dUZ1dGczdWJjcXAwNUMyZnFY?=
 =?utf-8?Q?JKUs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04acd149-a4c8-44a6-1cd6-08da6e283ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 10:27:09.1547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9XOQIpATMBW+o4N6SwveNhJ6kyGrCJayJHQPrCynmc5ZVbv32kYNWhqAnWsuDV72
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1808
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
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClVzaW5nICJ1aW50NjRfdCIgaW5z
dGVhZCBvZiAidWludDMyX3QiIGZvciBlbnRyeSBjb3VudGVyIG1heSBiZSBiZXR0ZXIuDQoNCkJS
DQpFdmFuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFt
ZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBBbmRy
w6kgQWxtZWlkYQ0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAyMywgMjAyMiA0OjM0IEFNDQo+IFRv
OiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcs
IENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgUGFuLCBYaW5odWkgPFhp
bmh1aS5QYW5AYW1kLmNvbT47IERhdmlkDQo+IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IFpoYW5nLCBIYXdraW5nDQo+IDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IEt1ZWhsaW5n
LA0KPiBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IFhpYW8sIEphY2sgPEphY2suWGlh
b0BhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsg
U3REZW5pcywgVG9tIDxUb20uU3REZW5pc0BhbWQuY29tPjsgU2lxdWVpcmEsDQo+IFJvZHJpZ28g
PFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT4NCj4gQ2M6IEFuZHLDqSBBbG1laWRhIDxhbmRyZWFs
bWVpZEBpZ2FsaWEuY29tPjsga2VybmVsLWRldkBpZ2FsaWEuY29tDQo+IFN1YmplY3Q6IFtQQVRD
SCAxLzRdIGRybS9hbWQ6IEFkZCBkZXRhaWxlZCBHRlhPRkYgc3RhdHMgdG8gZGVidWdmcw0KPiAN
Cj4gQWRkIGRlYnVnZnMgaW50ZXJmYWNlIHRvIGxvZyBHRlhPRkYgc3RhdGlzdGljczoNCj4gDQo+
IC0gUmVhZCBhbWRncHVfZ2Z4b2ZmX2NvdW50IHRvIGdldCB0aGUgdG90YWwgR0ZYT0ZGIGVudHJ5
IGNvdW50IGF0IHRoZQ0KPiAgIHRpbWUgb2YgcXVlcnkgc2luY2Ugc3lzdGVtIHBvd2VyLXVwDQo+
IA0KPiAtIFdyaXRlIDEgdG8gYW1kZ3B1X2dmeG9mZl9yZXNpZGVuY3kgdG8gc3RhcnQgbG9nZ2lu
ZywgYW5kIDAgdG8gc3RvcC4NCj4gICBSZWFkIGl0IHRvIGdldCBhdmVyYWdlIEdGWE9GRiByZXNp
ZGVuY3kgJSBtdWx0aXBsaWVkIGJ5IDEwMA0KPiAgIGR1cmluZyB0aGUgbGFzdCBsb2dnaW5nIGlu
dGVydmFsLg0KPiANCj4gQm90aCBmZWF0dXJlcyBhcmUgZGVzaWduZWQgdG8gYmUga2VlcCB0aGUg
dmFsdWVzIHBlcnNpc3RlbnQgYmV0d2Vlbg0KPiBzdXNwZW5kcy4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHLDqSBBbG1laWRhIDxhbmRyZWFsbWVpZEBpZ2FsaWEuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgICB8IDE2OA0KPiArKysr
KysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyAgICB8ICAgMiArDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4
LmMgICAgICAgfCAgMzkgKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dmeC5oICAgICAgIHwgICA2ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X2Rw
bS5jICAgICAgICAgICB8ICA0NSArKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMv
YW1kZ3B1X2RwbS5oICAgICAgIHwgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvYW1kZ3B1X3NtdS5jICAgICB8ICAzNCArKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3N3c211L2luYy9hbWRncHVfc211LmggfCAgMjIgKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3N3c211L3NtdV9pbnRlcm5hbC5oICAgfCAgIDMgKw0KPiAgOSBmaWxlcyBjaGFuZ2VkLCAz
MjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jDQo+IGluZGV4IGUyZWVjOTg1YWRiMy4uZWRm
OTBhOWJhOTgwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZWJ1Z2ZzLmMNCj4gQEAgLTEwNDIsNiArMTA0MiwxNTcgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1
X2RlYnVnZnNfZ3ByX3JlYWQoc3RydWN0DQo+IGZpbGUgKmYsIGNoYXIgX191c2VyICpidWYsDQo+
ICAJcmV0dXJuIHI7DQo+ICB9DQo+IA0KPiArLyoqDQo+ICsgKiBhbWRncHVfZGVidWdmc19nZnhv
ZmZfcmVzaWRlbmN5X3JlYWQgLSBSZWFkIEdGWE9GRiByZXNpZGVuY3kNCj4gKyAqDQo+ICsgKiBA
Zjogb3BlbiBmaWxlIGhhbmRsZQ0KPiArICogQGJ1ZjogVXNlciBidWZmZXIgdG8gc3RvcmUgcmVh
ZCBkYXRhIGluDQo+ICsgKiBAc2l6ZTogTnVtYmVyIG9mIGJ5dGVzIHRvIHJlYWQNCj4gKyAqIEBw
b3M6ICBPZmZzZXQgdG8gc2VlayB0bw0KPiArICoNCj4gKyAqIFJlYWQgdGhlIGxhc3QgcmVzaWRl
bmN5IHZhbHVlIGxvZ2dlZC4gSXQgZG9lc24ndCBhdXRvIHVwZGF0ZSwgb25lIG5lZWRzDQo+IHRv
DQo+ICsgKiBzdG9wIGxvZ2dpbmcgYmVmb3JlIGdldHRpbmcgdGhlIGN1cnJlbnQgdmFsdWUuDQo+
ICsgKi8NCj4gK3N0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9yZXNpZGVuY3lf
cmVhZChzdHJ1Y3QgZmlsZSAqZiwgY2hhcg0KPiBfX3VzZXIgKmJ1ZiwNCj4gKwkJCQkJCSAgICBz
aXplX3Qgc2l6ZSwgbG9mZl90ICpwb3MpDQo+ICt7DQo+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYgPSBmaWxlX2lub2RlKGYpLT5pX3ByaXZhdGU7DQo+ICsJc3NpemVfdCByZXN1bHQgPSAw
Ow0KPiArCWludCByOw0KPiArDQo+ICsJaWYgKHNpemUgJiAweDMgfHwgKnBvcyAmIDB4MykNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlyID0gcG1fcnVudGltZV9nZXRfc3luYyhhZGV2
X3RvX2RybShhZGV2KS0+ZGV2KTsNCj4gKwlpZiAociA8IDApIHsNCj4gKwkJcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoYWRldl90b19kcm0oYWRldiktPmRldik7DQo+ICsJCXJldHVybiByOw0K
PiArCX0NCj4gKw0KPiArCXdoaWxlIChzaXplKSB7DQo+ICsJCXVpbnQzMl90IHZhbHVlOw0KPiAr
DQo+ICsJCXIgPSBhbWRncHVfZ2V0X2dmeF9vZmZfcmVzaWRlbmN5KGFkZXYsICZ2YWx1ZSk7DQo+
ICsJCWlmIChyKQ0KPiArCQkJZ290byBvdXQ7DQo+ICsNCj4gKwkJciA9IHB1dF91c2VyKHZhbHVl
LCAodWludDMyX3QgKilidWYpOw0KPiArCQlpZiAocikNCj4gKwkJCWdvdG8gb3V0Ow0KPiArDQo+
ICsJCXJlc3VsdCArPSA0Ow0KPiArCQlidWYgKz0gNDsNCj4gKwkJKnBvcyArPSA0Ow0KPiArCQlz
aXplIC09IDQ7DQo+ICsJfQ0KPiArDQo+ICsJciA9IHJlc3VsdDsNCj4gK291dDoNCj4gKwlwbV9y
dW50aW1lX21hcmtfbGFzdF9idXN5KGFkZXZfdG9fZHJtKGFkZXYpLT5kZXYpOw0KPiArCXBtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGFkZXZfdG9fZHJtKGFkZXYpLT5kZXYpOw0KPiArDQo+ICsJ
cmV0dXJuIHI7DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogYW1kZ3B1X2RlYnVnZnNfZ2Z4b2Zm
X3Jlc2lkZW5jeV93cml0ZSAtIExvZyBHRlhPRkYgUmVzaWRlbmN5DQo+ICsgKg0KPiArICogQGY6
IG9wZW4gZmlsZSBoYW5kbGUNCj4gKyAqIEBidWY6IFVzZXIgYnVmZmVyIHRvIHdyaXRlIGRhdGEg
ZnJvbQ0KPiArICogQHNpemU6IE51bWJlciBvZiBieXRlcyB0byB3cml0ZQ0KPiArICogQHBvczog
IE9mZnNldCB0byBzZWVrIHRvDQo+ICsgKg0KPiArICogV3JpdGUgYSAzMi1iaXQgbm9uLXplcm8g
dG8gc3RhcnQgbG9nZ2luZzsgd3JpdGUgYSAzMi1iaXQgemVybyB0byBzdG9wDQo+ICsgKi8NCj4g
K3N0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9yZXNpZGVuY3lfd3JpdGUoc3Ry
dWN0IGZpbGUgKmYsIGNvbnN0DQo+IGNoYXIgX191c2VyICpidWYsDQo+ICsJCQkJCQkgICAgIHNp
emVfdCBzaXplLCBsb2ZmX3QgKnBvcykNCj4gK3sNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IGZpbGVfaW5vZGUoZiktPmlfcHJpdmF0ZTsNCj4gKwlzc2l6ZV90IHJlc3VsdCA9IDA7
DQo+ICsJaW50IHI7DQo+ICsNCj4gKwlpZiAoc2l6ZSAmIDB4MyB8fCAqcG9zICYgMHgzKQ0KPiAr
CQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCXIgPSBwbV9ydW50aW1lX2dldF9zeW5jKGFkZXZf
dG9fZHJtKGFkZXYpLT5kZXYpOw0KPiArCWlmIChyIDwgMCkgew0KPiArCQlwbV9ydW50aW1lX3B1
dF9hdXRvc3VzcGVuZChhZGV2X3RvX2RybShhZGV2KS0+ZGV2KTsNCj4gKwkJcmV0dXJuIHI7DQo+
ICsJfQ0KPiArDQo+ICsJd2hpbGUgKHNpemUpIHsNCj4gKwkJdTMyIHZhbHVlOw0KPiArDQo+ICsJ
CXIgPSBnZXRfdXNlcih2YWx1ZSwgKHVpbnQzMl90ICopYnVmKTsNCj4gKwkJaWYgKHIpDQo+ICsJ
CQlnb3RvIG91dDsNCj4gKw0KPiArCQlhbWRncHVfc2V0X2dmeF9vZmZfcmVzaWRlbmN5KGFkZXYs
IHZhbHVlID8gdHJ1ZSA6IGZhbHNlKTsNCj4gKw0KPiArCQlyZXN1bHQgKz0gNDsNCj4gKwkJYnVm
ICs9IDQ7DQo+ICsJCSpwb3MgKz0gNDsNCj4gKwkJc2l6ZSAtPSA0Ow0KPiArCX0NCj4gKw0KPiAr
CXIgPSByZXN1bHQ7DQo+ICtvdXQ6DQo+ICsJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShhZGV2
X3RvX2RybShhZGV2KS0+ZGV2KTsNCj4gKwlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChhZGV2
X3RvX2RybShhZGV2KS0+ZGV2KTsNCj4gKw0KPiArCXJldHVybiByOw0KPiArfQ0KPiArDQo+ICsN
Cj4gKy8qKg0KPiArICogYW1kZ3B1X2RlYnVnZnNfZ2Z4b2ZmX2NvdW50X3JlYWQgLSBSZWFkIEdG
WE9GRiBlbnRyeSBjb3VudA0KPiArICoNCj4gKyAqIEBmOiBvcGVuIGZpbGUgaGFuZGxlDQo+ICsg
KiBAYnVmOiBVc2VyIGJ1ZmZlciB0byBzdG9yZSByZWFkIGRhdGEgaW4NCj4gKyAqIEBzaXplOiBO
dW1iZXIgb2YgYnl0ZXMgdG8gcmVhZA0KPiArICogQHBvczogIE9mZnNldCB0byBzZWVrIHRvDQo+
ICsgKi8NCj4gK3N0YXRpYyBzc2l6ZV90IGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9jb3VudF9yZWFk
KHN0cnVjdCBmaWxlICpmLCBjaGFyDQo+IF9fdXNlciAqYnVmLA0KPiArCQkJCQkJc2l6ZV90IHNp
emUsIGxvZmZfdCAqcG9zKQ0KPiArew0KPiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
ZmlsZV9pbm9kZShmKS0+aV9wcml2YXRlOw0KPiArCXNzaXplX3QgcmVzdWx0ID0gMDsNCj4gKwlp
bnQgcjsNCj4gKw0KPiArCWlmIChzaXplICYgMHgzIHx8ICpwb3MgJiAweDMpDQo+ICsJCXJldHVy
biAtRUlOVkFMOw0KPiArDQo+ICsJciA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoYWRldl90b19kcm0o
YWRldiktPmRldik7DQo+ICsJaWYgKHIgPCAwKSB7DQo+ICsJCXBtX3J1bnRpbWVfcHV0X2F1dG9z
dXNwZW5kKGFkZXZfdG9fZHJtKGFkZXYpLT5kZXYpOw0KPiArCQlyZXR1cm4gcjsNCj4gKwl9DQo+
ICsNCj4gKwl3aGlsZSAoc2l6ZSkgew0KPiArCQl1MzIgdmFsdWU7DQo+ICsNCj4gKwkJciA9IGFt
ZGdwdV9nZXRfZ2Z4X29mZl9lbnRyeWNvdW50KGFkZXYsICZ2YWx1ZSk7DQo+ICsJCWlmIChyKQ0K
PiArCQkJZ290byBvdXQ7DQo+ICsNCj4gKwkJciA9IHB1dF91c2VyKHZhbHVlLCAodWludDMyX3Qg
KilidWYpOw0KPiArCQlpZiAocikNCj4gKwkJCWdvdG8gb3V0Ow0KPiArDQo+ICsJCXJlc3VsdCAr
PSA0Ow0KPiArCQlidWYgKz0gNDsNCj4gKwkJKnBvcyArPSA0Ow0KPiArCQlzaXplIC09IDQ7DQo+
ICsJfQ0KPiArDQo+ICsJciA9IHJlc3VsdDsNCj4gK291dDoNCj4gKwlwbV9ydW50aW1lX21hcmtf
bGFzdF9idXN5KGFkZXZfdG9fZHJtKGFkZXYpLT5kZXYpOw0KPiArCXBtX3J1bnRpbWVfcHV0X2F1
dG9zdXNwZW5kKGFkZXZfdG9fZHJtKGFkZXYpLT5kZXYpOw0KPiArDQo+ICsJcmV0dXJuIHI7DQo+
ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogYW1kZ3B1X2RlYnVnZnNfZ2Z4b2ZmX3dyaXRlIC0gRW5h
YmxlL2Rpc2FibGUgR0ZYT0ZGDQo+ICAgKg0KPiBAQCAtMTI0OSw2ICsxNDAwLDE5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zDQo+IGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9z
dGF0dXNfZm9wcyA9IHsNCj4gIAkubGxzZWVrID0gZGVmYXVsdF9sbHNlZWsNCj4gIH07DQo+IA0K
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgYW1kZ3B1X2RlYnVnZnNfZ2Z4
b2ZmX2NvdW50X2ZvcHMgPSB7DQo+ICsJLm93bmVyID0gVEhJU19NT0RVTEUsDQo+ICsJLnJlYWQg
PSBhbWRncHVfZGVidWdmc19nZnhvZmZfY291bnRfcmVhZCwNCj4gKwkubGxzZWVrID0gZGVmYXVs
dF9sbHNlZWsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRp
b25zIGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9yZXNpZGVuY3lfZm9wcw0KPiA9IHsNCj4gKwkub3du
ZXIgPSBUSElTX01PRFVMRSwNCj4gKwkucmVhZCA9IGFtZGdwdV9kZWJ1Z2ZzX2dmeG9mZl9yZXNp
ZGVuY3lfcmVhZCwNCj4gKwkud3JpdGUgPSBhbWRncHVfZGVidWdmc19nZnhvZmZfcmVzaWRlbmN5
X3dyaXRlLA0KPiArCS5sbHNlZWsgPSBkZWZhdWx0X2xsc2Vlaw0KPiArfTsNCj4gKw0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgKmRlYnVnZnNfcmVnc1tdID0gew0KPiAg
CSZhbWRncHVfZGVidWdmc19yZWdzX2ZvcHMsDQo+ICAJJmFtZGdwdV9kZWJ1Z2ZzX3JlZ3MyX2Zv
cHMsDQo+IEBAIC0xMjYxLDYgKzE0MjUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3Bl
cmF0aW9ucyAqZGVidWdmc19yZWdzW10NCj4gPSB7DQo+ICAJJmFtZGdwdV9kZWJ1Z2ZzX2dwcl9m
b3BzLA0KPiAgCSZhbWRncHVfZGVidWdmc19nZnhvZmZfZm9wcywNCj4gIAkmYW1kZ3B1X2RlYnVn
ZnNfZ2Z4b2ZmX3N0YXR1c19mb3BzLA0KPiArCSZhbWRncHVfZGVidWdmc19nZnhvZmZfY291bnRf
Zm9wcywNCj4gKwkmYW1kZ3B1X2RlYnVnZnNfZ2Z4b2ZmX3Jlc2lkZW5jeV9mb3BzLA0KPiAgfTsN
Cj4gDQo+ICBzdGF0aWMgY29uc3QgY2hhciAqZGVidWdmc19yZWdzX25hbWVzW10gPSB7DQo+IEBA
IC0xMjc1LDYgKzE0NDEsOCBAQCBzdGF0aWMgY29uc3QgY2hhciAqZGVidWdmc19yZWdzX25hbWVz
W10gPSB7DQo+ICAJImFtZGdwdV9ncHIiLA0KPiAgCSJhbWRncHVfZ2Z4b2ZmIiwNCj4gIAkiYW1k
Z3B1X2dmeG9mZl9zdGF0dXMiLA0KPiArCSJhbWRncHVfZ2Z4b2ZmX2NvdW50IiwNCj4gKwkiYW1k
Z3B1X2dmeG9mZl9yZXNpZGVuY3kiLA0KPiAgfTsNCj4gDQo+ICAvKioNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBpbmRleCBiNzllZTRmZmI4Nzku
LjE1YTk1YmMyYzIxMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYw0KPiBAQCAtMzU3Niw2ICszNTc2LDggQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldiwNCj4gIAlJTklUX1dPUksoJmFkZXYtPnhn
bWlfcmVzZXRfd29yaywNCj4gYW1kZ3B1X2RldmljZV94Z21pX3Jlc2V0X2Z1bmMpOw0KPiANCj4g
IAlhZGV2LT5nZnguZ2Z4X29mZl9yZXFfY291bnQgPSAxOw0KPiArCWFkZXYtPmdmeC5nZnhfb2Zm
X3Jlc2lkZW5jeSA9IDA7DQo+ICsJYWRldi0+Z2Z4LmdmeF9vZmZfZW50cnljb3VudCA9IDA7DQo+
ICAJYWRldi0+cG0uYWNfcG93ZXIgPSBwb3dlcl9zdXBwbHlfaXNfc3lzdGVtX3N1cHBsaWVkKCkg
PiAwOw0KPiANCj4gIAlhdG9taWNfc2V0KCZhZGV2LT50aHJvdHRsaW5nX2xvZ2dpbmdfZW5hYmxl
ZCwgMSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2Z4LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMNCj4gaW5k
ZXggMjIyZDNkN2VhMDc2Li4zNjc1YzFiODk5ZGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2Z4LmMNCj4gQEAgLTYxMCw2ICs2MTAsNDUgQEAgdm9pZCBhbWRncHVf
Z2Z4X29mZl9jdHJsKHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICphZGV2LCBib29sIGVuYWJsZSkN
Cj4gIAltdXRleF91bmxvY2soJmFkZXYtPmdmeC5nZnhfb2ZmX211dGV4KTsNCj4gIH0NCj4gDQo+
ICtpbnQgYW1kZ3B1X3NldF9nZnhfb2ZmX3Jlc2lkZW5jeShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgYm9vbA0KPiB2YWx1ZSkNCj4gK3sNCj4gKwlpbnQgciA9IDA7DQo+ICsNCj4gKwltdXRl
eF9sb2NrKCZhZGV2LT5nZnguZ2Z4X29mZl9tdXRleCk7DQo+ICsNCj4gKwlyID0gYW1kZ3B1X2Rw
bV9zZXRfcmVzaWRlbmN5X2dmeG9mZihhZGV2LCB2YWx1ZSk7DQo+ICsNCj4gKwltdXRleF91bmxv
Y2soJmFkZXYtPmdmeC5nZnhfb2ZmX211dGV4KTsNCj4gKw0KPiArCXJldHVybiByOw0KPiArfQ0K
PiArDQo+ICtpbnQgYW1kZ3B1X2dldF9nZnhfb2ZmX3Jlc2lkZW5jeShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdTMyDQo+ICp2YWx1ZSkNCj4gK3sNCj4gKwlpbnQgciA9IDA7DQo+ICsNCj4g
KwltdXRleF9sb2NrKCZhZGV2LT5nZnguZ2Z4X29mZl9tdXRleCk7DQo+ICsNCj4gKwlyID0gYW1k
Z3B1X2RwbV9nZXRfcmVzaWRlbmN5X2dmeG9mZihhZGV2LCB2YWx1ZSk7DQo+ICsNCj4gKwltdXRl
eF91bmxvY2soJmFkZXYtPmdmeC5nZnhfb2ZmX211dGV4KTsNCj4gKw0KPiArCXJldHVybiByOw0K
PiArfQ0KPiArDQo+ICtpbnQgYW1kZ3B1X2dldF9nZnhfb2ZmX2VudHJ5Y291bnQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHUzMg0KPiAqdmFsdWUpDQo+ICt7DQo+ICsJaW50IHIgPSAwOw0K
PiArDQo+ICsJbXV0ZXhfbG9jaygmYWRldi0+Z2Z4LmdmeF9vZmZfbXV0ZXgpOw0KPiArDQo+ICsJ
ciA9IGFtZGdwdV9kcG1fZ2V0X2VudHJ5Y291bnRfZ2Z4b2ZmKGFkZXYsIHZhbHVlKTsNCj4gKw0K
PiArCW11dGV4X3VubG9jaygmYWRldi0+Z2Z4LmdmeF9vZmZfbXV0ZXgpOw0KPiArDQo+ICsJcmV0
dXJuIHI7DQo+ICt9DQo+ICsNCj4gIGludCBhbWRncHVfZ2V0X2dmeF9vZmZfc3RhdHVzKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdA0KPiAqdmFsdWUpDQo+ICB7DQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oDQo+IGluZGV4IDIzYTY5NmQz
ODM5MC4uZjA2ZTk3OWUyNTY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dmeC5oDQo+IEBAIC0zMzYsNiArMzM2LDggQEAgc3RydWN0IGFtZGdwdV9nZnggew0KPiAg
CXN0cnVjdCBtdXRleCAgICAgICAgICAgICAgICAgICAgZ2Z4X29mZl9tdXRleDsNCj4gIAl1aW50
MzJfdCAgICAgICAgICAgICAgICAgICAgICAgIGdmeF9vZmZfcmVxX2NvdW50OyAvKiBkZWZhdWx0
IDEsIGVuYWJsZSBnZnggb2ZmOg0KPiBkZWMgMSwgZGlzYWJsZSBnZnggb2ZmOiBhZGQgMSAqLw0K
PiAgCXN0cnVjdCBkZWxheWVkX3dvcmsgICAgICAgICAgICAgZ2Z4X29mZl9kZWxheV93b3JrOw0K
PiArCXVpbnQzMl90ICAgICAgICAgICAgICAgICAgICAgICAgZ2Z4X29mZl9yZXNpZGVuY3k7DQo+
ICsJdWludDMyX3QgICAgICAgICAgICAgICAgICAgICAgICBnZnhfb2ZmX2VudHJ5Y291bnQ7DQo+
IA0KPiAgCS8qIHBpcGUgcmVzZXJ2YXRpb24gKi8NCj4gIAlzdHJ1Y3QgbXV0ZXgJCQlwaXBlX3Jl
c2VydmVfbXV0ZXg7DQo+IEBAIC00MDcsNiArNDA5LDEwIEBAIGJvb2wgYW1kZ3B1X2dmeF9pc19t
ZV9xdWV1ZV9lbmFibGVkKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQgbWUsDQo+
ICB2b2lkIGFtZGdwdV9nZnhfb2ZmX2N0cmwoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJv
b2wgZW5hYmxlKTsNCj4gIGludCBhbWRncHVfZ2V0X2dmeF9vZmZfc3RhdHVzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB1aW50MzJfdA0KPiAqdmFsdWUpOw0KPiAgaW50IGFtZGdwdV9nZnhf
cmFzX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0DQo+IHJhc19j
b21tb25faWYgKnJhc19ibG9jayk7DQo+ICt2b2lkIGFtZGdwdV9nZnhfcmFzX2Zpbmkoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAraW50IGFtZGdwdV9nZXRfZ2Z4X29mZl9lbnRyeWNv
dW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzINCj4gKnZhbHVlKTsNCj4gK2ludCBh
bWRncHVfZ2V0X2dmeF9vZmZfcmVzaWRlbmN5KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
MzINCj4gKnJlc2lkZW5jeSk7DQo+ICtpbnQgYW1kZ3B1X3NldF9nZnhfb2ZmX3Jlc2lkZW5jeShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbA0KPiB2YWx1ZSk7DQo+ICBpbnQgYW1kZ3B1
X2dmeF9wcm9jZXNzX3Jhc19kYXRhX2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAg
CQl2b2lkICplcnJfZGF0YSwNCj4gIAkJc3RydWN0IGFtZGdwdV9pdl9lbnRyeSAqZW50cnkpOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYw0KPiBpbmRleCA5NTZiNmNlODFjODQu
LmRmODdkMDc2OGZkNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRn
cHVfZHBtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMNCj4g
QEAgLTY2OCw2ICs2NjgsNTEgQEAgaW50IGFtZGdwdV9kcG1fd2FpdF9mb3JfZXZlbnQoc3RydWN0
DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICtp
bnQgYW1kZ3B1X2RwbV9zZXRfcmVzaWRlbmN5X2dmeG9mZihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgYm9vbA0KPiB2YWx1ZSkNCj4gK3sNCj4gKwlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9
IGFkZXYtPnBvd2VycGxheS5wcF9oYW5kbGU7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwlp
ZiAoIWlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQ0KPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+
ICsNCj4gKwltdXRleF9sb2NrKCZhZGV2LT5wbS5tdXRleCk7DQo+ICsJcmV0ID0gc211X3NldF9y
ZXNpZGVuY3lfZ2Z4b2ZmKHNtdSwgdmFsdWUpOw0KPiArCW11dGV4X3VubG9jaygmYWRldi0+cG0u
bXV0ZXgpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiAraW50IGFtZGdwdV9k
cG1fZ2V0X3Jlc2lkZW5jeV9nZnhvZmYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMg0K
PiAqdmFsdWUpDQo+ICt7DQo+ICsJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSBhZGV2LT5wb3dl
cnBsYXkucHBfaGFuZGxlOw0KPiArCWludCByZXQgPSAwOw0KPiArDQo+ICsJaWYgKCFpc19zdXBw
b3J0X3N3X3NtdShhZGV2KSkNCj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiArDQo+ICsJbXV0
ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgpOw0KPiArCXJldCA9IHNtdV9nZXRfcmVzaWRlbmN5X2dm
eG9mZihzbXUsIHZhbHVlKTsNCj4gKwltdXRleF91bmxvY2soJmFkZXYtPnBtLm11dGV4KTsNCj4g
Kw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK2ludCBhbWRncHVfZHBtX2dldF9lbnRy
eWNvdW50X2dmeG9mZihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gdTMyICp2YWx1ZSkN
Cj4gK3sNCj4gKwlzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSA9IGFkZXYtPnBvd2VycGxheS5wcF9o
YW5kbGU7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwlpZiAoIWlzX3N1cHBvcnRfc3dfc211
KGFkZXYpKQ0KPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZh
ZGV2LT5wbS5tdXRleCk7DQo+ICsJcmV0ID0gc211X2dldF9lbnRyeWNvdW50X2dmeG9mZihzbXUs
IHZhbHVlKTsNCj4gKwltdXRleF91bmxvY2soJmFkZXYtPnBtLm11dGV4KTsNCj4gKw0KPiArCXJl
dHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gIGludCBhbWRncHVfZHBtX2dldF9zdGF0dXNfZ2Z4b2Zm
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdA0KPiAqdmFsdWUpDQo+ICB7DQo+
ICAJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSBhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X2RwbS5oDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X2RwbS5oDQo+IGluZGV4IDY1NjI0
ZDA5MWVkMi4uODNhODNlOTMwMzdjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL2luYy9hbWRncHVfZHBtLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMv
YW1kZ3B1X2RwbS5oDQo+IEBAIC00MzUsNiArNDM1LDkgQEAgaW50IGFtZGdwdV9kcG1fc2V0X3Nv
ZnRfZnJlcV9yYW5nZShzdHJ1Y3QNCj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gIGludCBhbWRn
cHVfZHBtX3dyaXRlX3dhdGVybWFya3NfdGFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Ow0KPiAgaW50IGFtZGdwdV9kcG1fd2FpdF9mb3JfZXZlbnQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIGVudW0NCj4gc211X2V2ZW50X3R5cGUgZXZlbnQsDQo+ICAJCSAgICAgICB1aW50NjRf
dCBldmVudF9hcmcpOw0KPiAraW50IGFtZGdwdV9kcG1fZ2V0X3Jlc2lkZW5jeV9nZnhvZmYoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMg0KPiAqdmFsdWUpOw0KPiAraW50IGFtZGdwdV9k
cG1fc2V0X3Jlc2lkZW5jeV9nZnhvZmYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wN
Cj4gdmFsdWUpOw0KPiAraW50IGFtZGdwdV9kcG1fZ2V0X2VudHJ5Y291bnRfZ2Z4b2ZmKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiB1MzIgKnZhbHVlKTsNCj4gIGludCBhbWRncHVfZHBt
X2dldF9zdGF0dXNfZ2Z4b2ZmKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdA0K
PiAqdmFsdWUpOw0KPiAgdWludDY0X3QgYW1kZ3B1X2RwbV9nZXRfdGhlcm1hbF90aHJvdHRsaW5n
X2NvdW50ZXIoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAgdm9pZCBhbWRncHVf
ZHBtX2dmeF9zdGF0ZV9jaGFuZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2FtZGdwdV9zbXUuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvYW1kZ3B1X3NtdS5jDQo+IGluZGV4IGZkNzliMjEz
ZmFiNC4uY2ZjM2I5ZDc0OWJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3N3c211L2FtZGdwdV9zbXUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211
L2FtZGdwdV9zbXUuYw0KPiBAQCAtOTAsNiArOTAsMzAgQEAgc3RhdGljIGludCBzbXVfc3lzX3Nl
dF9wcF9mZWF0dXJlX21hc2sodm9pZCAqaGFuZGxlLA0KPiAgCXJldHVybiBzbXVfc2V0X3BwX2Zl
YXR1cmVfbWFzayhzbXUsIG5ld19tYXNrKTsNCj4gIH0NCj4gDQo+ICtpbnQgc211X3NldF9yZXNp
ZGVuY3lfZ2Z4b2ZmKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBib29sIHZhbHVlKQ0KPiArew0K
PiArCWlmICghc211LT5wcHRfZnVuY3MtPnNldF9nZnhfb2ZmX3Jlc2lkZW5jeSkNCj4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlyZXR1cm4gc211X3NldF9nZnhfb2ZmX3Jlc2lkZW5jeShz
bXUsIHZhbHVlKTsNCj4gK30NCj4gKw0KPiAraW50IHNtdV9nZXRfcmVzaWRlbmN5X2dmeG9mZihz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdTMyICp2YWx1ZSkNCj4gK3sNCj4gKwlpZiAoIXNtdS0+
cHB0X2Z1bmNzLT5nZXRfZ2Z4X29mZl9yZXNpZGVuY3kpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0K
PiArDQo+ICsJcmV0dXJuIHNtdV9nZXRfZ2Z4X29mZl9yZXNpZGVuY3koc211LCB2YWx1ZSk7DQo+
ICt9DQo+ICsNCj4gK2ludCBzbXVfZ2V0X2VudHJ5Y291bnRfZ2Z4b2ZmKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCB1MzIgKnZhbHVlKQ0KPiArew0KPiArCWlmICghc211LT5wcHRfZnVuY3MtPmdl
dF9nZnhfb2ZmX2VudHJ5Y291bnQpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJcmV0
dXJuIHNtdV9nZXRfZ2Z4X29mZl9lbnRyeWNvdW50KHNtdSwgdmFsdWUpOw0KPiArfQ0KPiArDQo+
ICBpbnQgc211X2dldF9zdGF0dXNfZ2Z4b2ZmKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50
MzJfdCAqdmFsdWUpDQo+ICB7DQo+ICAJaWYgKCFzbXUtPnBwdF9mdW5jcy0+Z2V0X2dmeF9vZmZf
c3RhdHVzKQ0KPiBAQCAtMTU3Myw3ICsxNTk3LDcgQEAgc3RhdGljIGludCBzbXVfc3VzcGVuZCh2
b2lkICpoYW5kbGUpDQo+ICB7DQo+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7DQo+ICAJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUg
PSBhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlOw0KPiAtCWludCByZXQ7DQo+ICsJaW50IHJldCwg
Y291bnQ7DQo+IA0KPiAgCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikmJiAhYW1kZ3B1X3NyaW92
X2lzX3BwX29uZV92ZihhZGV2KSkNCj4gIAkJcmV0dXJuIDA7DQo+IEBAIC0xNTkxLDYgKzE2MTUs
MTQgQEAgc3RhdGljIGludCBzbXVfc3VzcGVuZCh2b2lkICpoYW5kbGUpDQo+IA0KPiAgCXNtdV9z
ZXRfZ2Z4X2NncGcoc211LCBmYWxzZSk7DQo+IA0KPiArCS8qDQo+ICsJICogcHdmdyByZXNldHMg
ZW50cnljb3VudCB3aGVuIGRldmljZSBpcyBzdXNwZW5kZWQsIHNvIHdlIHNhdmUNCj4gdGhlDQo+
ICsJICogbGFzdCB2YWx1ZSB0byBiZSB1c2VkIHdoZW4gd2UgcmVzdW1lIHRvIGtlZXAgaXQgY29u
c2lzdGVudA0KPiArCSAqLw0KPiArCXJldCA9IHNtdV9nZXRfZW50cnljb3VudF9nZnhvZmYoc211
LCAmY291bnQpOw0KPiArCWlmICghcmV0KQ0KPiArCQlhZGV2LT5nZnguZ2Z4X29mZl9lbnRyeWNv
dW50ID0gY291bnQ7DQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2luYy9hbWRncHVfc211LmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2luYy9hbWRncHVfc211LmgNCj4gaW5kZXggYjgxYzY1
N2M3Mzg2Li45ODI3MDc1Yjc2OGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vc3dzbXUvaW5jL2FtZGdwdV9zbXUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3N3c211L2luYy9hbWRncHVfc211LmgNCj4gQEAgLTExMTEsNiArMTExMSwyMiBAQCBzdHJ1Y3Qg
cHB0YWJsZV9mdW5jcyB7DQo+ICAJICovDQo+ICAJdWludDMyX3QgKCpnZXRfZ2Z4X29mZl9zdGF0
dXMpKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsNCj4gDQo+ICsJLyoqDQo+ICsJICogQGdmeF9v
ZmZfZW50cnljb3VudDogdG90YWwgR0ZYT0ZGIGVudHJ5IGNvdW50IGF0IHRoZSB0aW1lIG9mDQo+
ICsJICogcXVlcnkgc2luY2Ugc3lzdGVtIHBvd2VyLXVwDQo+ICsJICovDQo+ICsJdTMyICgqZ2V0
X2dmeF9vZmZfZW50cnljb3VudCkoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90DQo+
ICplbnRyeWNvdW50KTsNCj4gKw0KPiArCS8qKg0KPiArCSAqIEBzZXRfZ2Z4X29mZl9yZXNpZGVu
Y3k6IHNldCAxIHRvIHN0YXJ0IGxvZ2dpbmcsIDAgdG8gc3RvcCBsb2dnaW5nDQo+ICsJICovDQo+
ICsJdTMyICgqc2V0X2dmeF9vZmZfcmVzaWRlbmN5KShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
Ym9vbCBzdGFydCk7DQo+ICsNCj4gKwkvKioNCj4gKwkgKiBAZ2V0X2dmeF9vZmZfcmVzaWRlbmN5
OiBBdmVyYWdlIEdGWE9GRiByZXNpZGVuY3kgJSBkdXJpbmcgdGhlDQo+IGxvZ2dpbmcgaW50ZXJ2
YWwNCj4gKwkgKi8NCj4gKwl1MzIgKCpnZXRfZ2Z4X29mZl9yZXNpZGVuY3kpKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCB1aW50MzJfdA0KPiAqcmVzaWRlbmN5KTsNCj4gKw0KPiAgCS8qKg0KPiAg
CSAqIEByZWdpc3Rlcl9pcnFfaGFuZGxlcjogUmVnaXN0ZXIgaW50ZXJ1cHQgcmVxdWVzdCBoYW5k
bGVycy4NCj4gIAkgKi8NCj4gQEAgLTE0NTQsNiArMTQ3MCwxMiBAQCBpbnQgc211X3NldF9hY19k
YyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7DQo+IA0KPiAgaW50IHNtdV9hbGxvd194Z21pX3Bv
d2VyX2Rvd24oc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgZW4pOw0KPiANCj4gK2ludCBz
bXVfZ2V0X2VudHJ5Y291bnRfZ2Z4b2ZmKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1MzIgKnZh
bHVlKTsNCj4gKw0KPiAraW50IHNtdV9nZXRfcmVzaWRlbmN5X2dmeG9mZihzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwgdTMyICp2YWx1ZSk7DQo+ICsNCj4gK2ludCBzbXVfc2V0X3Jlc2lkZW5jeV9n
ZnhvZmYoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGJvb2wgdmFsdWUpOw0KPiArDQo+ICBpbnQg
c211X2dldF9zdGF0dXNfZ2Z4b2ZmKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAq
dmFsdWUpOw0KPiANCj4gIGludCBzbXVfaGFuZGxlX3Bhc3N0aHJvdWdoX3NicihzdHJ1Y3Qgc211
X2NvbnRleHQgKnNtdSwgYm9vbCBlbmFibGUpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9zd3NtdS9zbXVfaW50ZXJuYWwuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vc3dzbXUvc211X2ludGVybmFsLmgNCj4gaW5kZXggNzQ2OWJiZmNlMWZiLi5jZWIxM2M4Mzgw
NjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211X2ludGVy
bmFsLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXVfaW50ZXJuYWwu
aA0KPiBAQCAtNDcsNiArNDcsOSBAQA0KPiAgI2RlZmluZSBzbXVfbm90aWZ5X21lbW9yeV9wb29s
X2xvY2F0aW9uKHNtdSkNCj4gCXNtdV9wcHRfZnVuY3Mobm90aWZ5X21lbW9yeV9wb29sX2xvY2F0
aW9uLCAwLCBzbXUpDQo+ICAjZGVmaW5lIHNtdV9nZnhfb2ZmX2NvbnRyb2woc211LCBlbmFibGUp
DQo+IAlzbXVfcHB0X2Z1bmNzKGdmeF9vZmZfY29udHJvbCwgMCwgc211LCBlbmFibGUpDQo+ICAj
ZGVmaW5lIHNtdV9nZXRfZ2Z4X29mZl9zdGF0dXMoc211KQ0KPiAJCXNtdV9wcHRfZnVuY3MoZ2V0
X2dmeF9vZmZfc3RhdHVzLCAwLCBzbXUpDQo+ICsjZGVmaW5lIHNtdV9nZXRfZ2Z4X29mZl9lbnRy
eWNvdW50KHNtdSwgdmFsdWUpDQo+IAkJCXNtdV9wcHRfZnVuY3MoZ2V0X2dmeF9vZmZfZW50cnlj
b3VudCwgMCwgc211LA0KPiB2YWx1ZSkNCj4gKyNkZWZpbmUgc211X2dldF9nZnhfb2ZmX3Jlc2lk
ZW5jeShzbXUsIHZhbHVlKQ0KPiAJCQlzbXVfcHB0X2Z1bmNzKGdldF9nZnhfb2ZmX3Jlc2lkZW5j
eSwgMCwgc211LA0KPiB2YWx1ZSkNCj4gKyNkZWZpbmUgc211X3NldF9nZnhfb2ZmX3Jlc2lkZW5j
eShzbXUsIHZhbHVlKQ0KPiAJCQlzbXVfcHB0X2Z1bmNzKHNldF9nZnhfb2ZmX3Jlc2lkZW5jeSwg
MCwgc211LA0KPiB2YWx1ZSkNCj4gICNkZWZpbmUgc211X3NldF9sYXN0X2RjZWZfbWluX2RlZXBf
c2xlZXBfY2xrKHNtdSkNCj4gCXNtdV9wcHRfZnVuY3Moc2V0X2xhc3RfZGNlZl9taW5fZGVlcF9z
bGVlcF9jbGssIDAsIHNtdSkNCj4gICNkZWZpbmUgc211X3N5c3RlbV9mZWF0dXJlc19jb250cm9s
KHNtdSwgZW4pDQo+IAlzbXVfcHB0X2Z1bmNzKHN5c3RlbV9mZWF0dXJlc19jb250cm9sLCAwLCBz
bXUsIGVuKQ0KPiAgI2RlZmluZSBzbXVfaW5pdF9tYXhfc3VzdGFpbmFibGVfY2xvY2tzKHNtdSkN
Cj4gCXNtdV9wcHRfZnVuY3MoaW5pdF9tYXhfc3VzdGFpbmFibGVfY2xvY2tzLCAwLCBzbXUpDQo+
IC0tDQo+IDIuMzcuMQ0K
