Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B77467FF
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jul 2023 05:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CEB10E27F;
	Tue,  4 Jul 2023 03:40:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48F210E282;
 Tue,  4 Jul 2023 03:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDCK0yjUBPTr4OeTAAf6TEvQ2lllEyTLZhWKTX+zvoq/YpB8V3VFQAK7s7YUX61tRPBQR/W0kVjtI1YHWLJ/f5bYCXIhdQsbCMKCnkCpQHR1VsZzEWkcxZHMMKAETnuDBvE+brJOeVNUNptCXkXpKbRk+/dldn/VpRoSJSOROwZQZsvGXuclNWfO9ubdAknBO3L96zMD0bTv0U9ZVZMKsk+Jxnp4CaqMiZaikV9kHdESEd8TxDGPoxQ3tX+e+UF4ZWf1ALIuM9H5nsIa5aNfjdfLv07vZLNZHp5UGL8+kgiq+0WMMkHT+DUIhjFpXVySrgNMfplBM8IMe5wqlhk0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4m71QXpR/JsQsP2a/0bjVshCwmqudGiieZfVGBSmt0=;
 b=izVyECApE3wmkJQqXfjBDmZxUpJcBKVRjLOOxyGn306/mttEhTFOxyA2ZqzMXHvS6Bhh2w4t7f0USJpvs+mEgRE1dxwPtbYVgpeozvoqEr/RHmYZr7b1jT48FX6Qz+4Xev1KM7NRmVSv7S4lu5XgqBePnDhPHdJ0sgiDFtzbMMUgezrmQ7WtCroA2e6dER0os7gwQ08uMylIhL2qyOCpCRE1k+Yz1M0y6uTuEXCpT57pDbXZbgOBYxWqdL9Y5eUWOqOtwVjMvzXbNEFCw6Sh1RoS3z4n5d8j3yCbtecT74pdO5p5wdvnG7yNa7W6fPC+3sCZpHsWAk+lH/HlWGzjgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4m71QXpR/JsQsP2a/0bjVshCwmqudGiieZfVGBSmt0=;
 b=yd9MRwua3vMEjDmk5Dd9+USN4KzJjt4Eng2vnyl7FLKMy1JgfFk7qtooScZvvypgqd7uZev2ADgWn/zoo2UhZ1NlIwAvPgSE29ASNaVk4wxC1i7ujwYz+vWlH5k/h3sAH1Dg3H9de0gWCtQAFdUgENXSmjA2d2nxyNfAE1pBmQo=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4879.namprd12.prod.outlook.com (2603:10b6:5:1b5::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.24; Tue, 4 Jul 2023 03:40:15 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::3bef:2463:a3e0:e51c%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 03:40:15 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, "jim.cromie@gmail.com" <jim.cromie@gmail.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>, "andrealmeid@igalia.com"
 <andrealmeid@igalia.com>, "trix@redhat.com" <trix@redhat.com>,
 "jsg@jsg.id.au" <jsg@jsg.id.au>, "arnd@arndb.de" <arnd@arndb.de>
Subject: RE: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Topic: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
Thread-Index: AQHZqz5nCvlP5HKi7kqHZhT1UyZB3K+jjMqAgAVtBaA=
Date: Tue, 4 Jul 2023 03:40:15 +0000
Message-ID: <DM6PR12MB26192D7A98B397CA9C8997F9E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
 <3e095621-d7dc-9069-45dc-498c8f3bb4f4@amd.com>
In-Reply-To: <3e095621-d7dc-9069-45dc-498c8f3bb4f4@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ef613276-b67a-4034-beb8-6eabe212caa5;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-04T03:32:24Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2619:EE_|DM6PR12MB4879:EE_
x-ms-office365-filtering-correlation-id: 147f449a-c222-4361-f380-08db7c40617d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ei+e37BDviOaeKh0a8cI3WYMCPSwbt/aC+Rof/MJ+w/YESNGMn4VEAiPhIV2CfLQ3WthDAqrQ7ZcYogziI4fHavwvrFISJtycr1mN07TDrfojChlIx61E4vPq2CKT/4XVtixN/oOscmgTeK/t86//rIItreLkacPMQ9fNGNoECmz1M+nNQTH6kzwOc1x1PRgBZPMVvTg8nQ8tOpFayfevASsCrmfuyjt9pJ/xLy5EphDkpw0r+7DQLjKOy/2/A7WbQr8Y77+c1nUxYQL4M/Nb8Flr1ORW+1qw+5nUNpsTcpJ+iIyq7vz9FRcQD//8pYBgzR4yfLqDpbaFN/+kSqIyucxcEtDahigHahiiGb2vpvC6WCCuV2b6io98sjF8dKjJg35eaaQnU9IB/JDuyZB4QyeYyNMoRSW0SpKXyN46TYUlNt3gGG1XOyUTeV/fDoiaejsRJQlj4kAosOGozW2HPLAksykvhxVm1qZ9NJzEGy54irQl7kOeRqUPjjzemS8e8UD1NFgJvv5cn8BkHopwFb+hBvCRjLWQD57cVEZ3M8cytvpQDdeXy1VAWzS1ZcgvBylXBgSFM3C3VFq2dO7u++HxgiZMO6psdgppV5rXB5TK5ENBu61P7aGj+2MjFLA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(26005)(478600001)(9686003)(71200400001)(6506007)(86362001)(186003)(122000001)(64756008)(38100700002)(54906003)(4326008)(66946007)(66446008)(66556008)(66476007)(83380400001)(921005)(110136005)(7696005)(53546011)(76116006)(316002)(8936002)(8676002)(52536014)(7416002)(30864003)(38070700005)(41300700001)(2906002)(55016003)(5660300002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qy9tbkgvdEEwaUI2ZnNTeEliYW1TbXBZYVJVeGp4aHBFZlBGclVmQU56ZVpY?=
 =?utf-8?B?QVVSR2Q3YkNjUEJHeFFCTElmME9hRVhORC9rR3hWN2ZBckpBaXYxUWNlTUdW?=
 =?utf-8?B?d2FnTzFXTjZZQzFJY29DVnJCeUNyMHJTTXROcFUyQUQzVUV1L1lKNlFxNExS?=
 =?utf-8?B?djYzODVGVFYrbWZZWURtSHhVR3RuT3c3T055WmFTblRqam9xYmpQNWFVVDJi?=
 =?utf-8?B?dkIrczlSaTE3bk9HMmpwSEx0bkxvWkhRWUtUaHRzTlg1NkMrWDNqcWZ3VWZ6?=
 =?utf-8?B?dFdPZHBoZmR0c1EwWlF2OUY5VldDaFRKb294clErcG1ISkJlV2xsWUs5U25p?=
 =?utf-8?B?cDNiS2g3NVQ5bVBPWEN6dVZoY1VHUnM2N3gxNWd6SDJIRi9BTSs5MUlrSEZp?=
 =?utf-8?B?L1hZZTZUYmh6UURLcndLTVpqT1VodWpjZ0l5ZFhtMkt5ZS9rQXl2Slc0bTRx?=
 =?utf-8?B?SzZLRkxmamdvdWVQTmZjRlB2OTZGUlRzcXowZVNQWUw4Mk4wSitUY1RYZUcy?=
 =?utf-8?B?VmlUSVN6TWFPRTFDVmd5Ym5FVTBINzFZNVpCQ2gxVXU1aXFqMzRHUGhmdjBP?=
 =?utf-8?B?SEJLYW9oOHNIOEcyc1pHWG9RVVZYYzFLR1JoZXQ1YkVlUlpsZC9aY3MvelVn?=
 =?utf-8?B?TkRWaXE1bVIxQmljSWxDNnhpUlp0ZkJFcHAwYVZTTnRQSWF1M2tGUmpVR2ta?=
 =?utf-8?B?d21paXZ1OUlVK0RCL2I2STJTbTFGWE0rTGYxckVXQ3YweTRTZElEeHdCMFdn?=
 =?utf-8?B?M3RhdnkyeU53VWhaQVY3QWVobEkrSmY0L0kzRWNmMnJWVHpGa25CVWJ0MnQ2?=
 =?utf-8?B?TWlieWVOeE9CKzRYdmNheHBkQ3M1enA4Y0t3Yzd0NU5OSVVGMnlHV0ZyQ254?=
 =?utf-8?B?bXoyZ3pJbkg4bUxmNG1od3B0OU9lakVZNWJmS3NOQ25COUU0eFRtYysrYWls?=
 =?utf-8?B?Y0s1ZFJkdTZmNndiUUZBc3VLOVlOVDJFQmNFRUEranlDNnRadmJ0MEthLzlL?=
 =?utf-8?B?bDdrVFZqZU5jVFo1NDcwMjdSTERjUmxkSHFGVzRuNWxYdG5XM09GdmdzZWtv?=
 =?utf-8?B?WURXMDhJblJIS1JZamRtYXhHRVI5cnZXLzVrSk5EVldDWU9vMDNLb002U05a?=
 =?utf-8?B?RGRKQm11VHQzSFMwV3g4YXBIOGVNTmhrTE1MTnhTVHlvcmQzV2h5R1V1R240?=
 =?utf-8?B?MWJQNHBsM1lOZU5LNE1salVoWENkUDc1R1UvR0M5Um9wOEljdi9Kd0VrS2tN?=
 =?utf-8?B?YndUQ1RoUjFhV3BVWXNpa20rK3ZNdmdWMGQ2blVMR1JhazFBYnVSU2lNb2tC?=
 =?utf-8?B?eFJSaWc3bFVzVUlWakt0UldiRDNzZnZkS2VXVFpSWTcvOFQwOUMwM1BZdS9p?=
 =?utf-8?B?RWxVNHBRdGhoeWFPRUNDUjlIWUhuUnB4d3NpR0FucStqcTZSemc1Q2R2WmVp?=
 =?utf-8?B?bzZaQ3cycFdJNzAxWjFZMVVsSVo1NUQ2ckxzVTlsQTB4K1JkSzFJaE42Wkxr?=
 =?utf-8?B?cnBhWHc3TVlVUGd1Y0M2QkRtbnJvNkIrOFlpMlN3ZzdPR2tZRENWV21TemhP?=
 =?utf-8?B?UndablEvbmhwbHRxbEVjUUZXcHR5dUY3K0ZTclptTENZek1wMmJvZTdidXZC?=
 =?utf-8?B?clF0aFR6U2lzK3lmSEF0RHpmcE5qQzFEanptQSt4TFUwOFRaMkxWQ3NjOC81?=
 =?utf-8?B?RXgxZmxSYnpGbGRtbjRaU2htbzRISlM2Tlh5aVdxcE1yTWplL2RBbWsvREE5?=
 =?utf-8?B?dFFwODBhcUNMY1BrUHNpM1FUZUtFMlZPY3duV3FsSHNJM3lpWUJDcEErTUxa?=
 =?utf-8?B?THlZZFhXaXFTKzdTcU5rUWJIWiszUUNEUVBmay9nZmZmVFY2ak01ZkM1clpN?=
 =?utf-8?B?SWU5L1NadEtKaEkxTVhIeXhRQklqblNKUnNWcFppMUFZMWdPVlh1MEUxVU0z?=
 =?utf-8?B?VVo0bHBXMUlQSEdPeUludkxuYmRDbVpCNlBiNkt2am1vcGd4ek9KU3pKdHZS?=
 =?utf-8?B?c1daLzY2RGs1SmF0TDUzM3BudXgvVCs3NHczcm5qd0djdUxiazlxNklHT2w5?=
 =?utf-8?B?KzRKcDB6SzBmeGRGOWg1Y0VkVlFBbGNGSXBqNnN1WkZCTkhWVFhCNHRhTlgr?=
 =?utf-8?Q?ckh8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147f449a-c222-4361-f380-08db7c40617d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 03:40:15.8360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2tU6fy5FDi30PQCCgJv/1MGbXNiF87PSdm6bRaLks3i0J32PVep7Z9FnMbo0+8R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4879
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxsb0Bh
bWQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVseSAxLCAyMDIzIDEyOjQxIEFNDQo+IFRvOiBR
dWFuLCBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IHJhZmFlbEBrZXJuZWwub3JnOyBsZW5iQGtl
cm5lbC5vcmc7DQo+IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBQYW4s
IFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsNCj4gYWlybGllZEBnbWFpbC5jb207IGRhbmll
bEBmZndsbC5jaDsgam9oYW5uZXNAc2lwc29sdXRpb25zLm5ldDsNCj4gZGF2ZW1AZGF2ZW1sb2Z0
Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsga3ViYUBrZXJuZWwub3JnOw0KPiBwYWJlbmlAcmVk
aGF0LmNvbTsgbWRhZW56ZXJAcmVkaGF0LmNvbTsNCj4gbWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tOyB0emltbWVybWFubkBzdXNlLmRlOw0KPiBoZGVnb2VkZUByZWRoYXQuY29tOyBq
aW5neXV3YW5nX3ZpcEAxNjMuY29tOyBMYXphciwgTGlqbw0KPiA8TGlqby5MYXphckBhbWQuY29t
PjsgamltLmNyb21pZUBnbWFpbC5jb207IGJlbGxvc2lsaWNpb0BnbWFpbC5jb207DQo+IGFuZHJl
YWxtZWlkQGlnYWxpYS5jb207IHRyaXhAcmVkaGF0LmNvbTsganNnQGpzZy5pZC5hdTsgYXJuZEBh
cm5kYi5kZQ0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtYWNwaUB2
Z2VyLmtlcm5lbC5vcmc7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtDQo+IHdpcmVsZXNzQHZnZXIua2VybmVs
Lm9yZzsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY1IDEv
OV0gZHJpdmVycyBjb3JlOiBBZGQgc3VwcG9ydCBmb3IgV2lmaSBiYW5kIFJGDQo+IG1pdGlnYXRp
b25zDQo+DQo+IE9uIDYvMzAvMjAyMyAwNTozMiwgRXZhbiBRdWFuIHdyb3RlOg0KPiA+IER1ZSB0
byBlbGVjdHJpY2FsIGFuZCBtZWNoYW5pY2FsIGNvbnN0cmFpbnRzIGluIGNlcnRhaW4gcGxhdGZv
cm0NCj4gPiBkZXNpZ25zIHRoZXJlIG1heSBiZSBsaWtlbHkgaW50ZXJmZXJlbmNlIG9mIHJlbGF0
aXZlbHkgaGlnaC1wb3dlcmVkDQo+ID4gaGFybW9uaWNzIG9mIHRoZSAoRy0pRERSIG1lbW9yeSBj
bG9ja3Mgd2l0aCBsb2NhbCByYWRpbyBtb2R1bGUNCj4gPiBmcmVxdWVuY3kgYmFuZHMgdXNlZCBi
eSBXaWZpIDYvNmUvNy4NCj4gPg0KPiA+IFRvIG1pdGlnYXRlIHRoaXMsIEFNRCBoYXMgaW50cm9k
dWNlZCBhIG1lY2hhbmlzbSB0aGF0IGRldmljZXMgY2FuIHVzZQ0KPiA+IHRvIG5vdGlmeSBhY3Rp
dmUgdXNlIG9mIHBhcnRpY3VsYXIgZnJlcXVlbmNpZXMgc28gdGhhdCBvdGhlciBkZXZpY2VzDQo+
ID4gY2FuIG1ha2UgcmVsYXRpdmUgaW50ZXJuYWwgYWRqdXN0bWVudHMgYXMgbmVjZXNzYXJ5IHRv
IGF2b2lkIHRoaXMgcmVzb25hbmNlLg0KPiA+DQo+ID4gSW4gb3JkZXIgZm9yIGEgZGV2aWNlIHRv
IHN1cHBvcnQgdGhpcywgdGhlIGV4cGVjdGVkIGZsb3cgZm9yIGRldmljZQ0KPiA+IGRyaXZlciBv
ciBzdWJzeXN0ZW1zOg0KPiA+DQo+ID4gRHJpdmVycy9zdWJzeXN0ZW1zIGNvbnRyaWJ1dGluZyBm
cmVxdWVuY2llczoNCj4gPg0KPiA+IDEpIER1cmluZyBwcm9iZSwgY2hlY2sgYHdicmZfc3VwcG9y
dGVkX3Byb2R1Y2VyYCB0byBzZWUgaWYgV0JSRg0KPiBzdXBwb3J0ZWQNCj4gPiAgICAgZm9yIHRo
ZSBkZXZpY2UuDQo+ID4gMikgSWYgYWRkaW5nIGZyZXF1ZW5jaWVzLCB0aGVuIGNhbGwgYHdicmZf
YWRkX2V4Y2x1c2lvbmAgd2l0aCB0aGUNCj4gPiAgICAgc3RhcnQgYW5kIGVuZCByYW5nZXMgb2Yg
dGhlIGZyZXF1ZW5jaWVzLg0KPiA+IDMpIElmIHJlbW92aW5nIGZyZXF1ZW5jaWVzLCB0aGVuIGNh
bGwgYHdicmZfcmVtb3ZlX2V4Y2x1c2lvbmAgd2l0aA0KPiA+ICAgICBzdGFydCBhbmQgZW5kIHJh
bmdlcyBvZiB0aGUgZnJlcXVlbmNpZXMuDQo+ID4NCj4gPiBEcml2ZXJzL3N1YnN5c3RlbXMgcmVz
cG9uZGluZyB0byBmcmVxdWVuY2llczoNCj4gPg0KPiA+IDEpIER1cmluZyBwcm9iZSwgY2hlY2sg
YHdicmZfc3VwcG9ydGVkX2NvbnN1bWVyYCB0byBzZWUgaWYgV0JSRiBpcw0KPiBzdXBwb3J0ZWQN
Cj4gPiAgICAgZm9yIHRoZSBkZXZpY2UuDQo+ID4gMikgQ2FsbCB0aGUgYHdicmZfcmV0cmlldmVf
ZXhjbHVzaW9uc2AgdG8gcmV0cmlldmUgdGhlIGN1cnJlbnQNCj4gPiAgICAgZXhjbHVzaW9ucyBv
biByZWNlaXZpbmcgYW4gQUNQSSBub3RpZmljYXRpb24gZm9yIGEgbmV3IGZyZXF1ZW5jeQ0KPiA+
ICAgICBjaGFuZ2UuDQo+ID4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IE1hcmlvIExpbW9uY2llbGxv
IDxtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmlvIExp
bW9uY2llbGxvIDxtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tPg0KPiA+IENvLWRldmVsb3BlZC1i
eTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiA+IC0tDQo+ID4gdjQtPnY1Og0KPiA+ICAgIC0g
cHJvbW90ZSB0aGlzIHRvIGJlIGEgbW9yZSBnZW5lcmljIHNvbHV0aW9uIHdpdGggaW5wdXQgYXJn
dW1lbnQgdGFraW5nDQo+ID4gICAgICBgc3RydWN0IGRldmljZWAgYW5kIHByb3ZpZGUgYmV0dGVy
IHNjYWxhYmlsaXR5IHRvIHN1cHBvcnQgbm9uLUFDUEkNCj4gPiAgICAgIHNjZW5hcmlvcyhBbmRy
ZXcpDQo+ID4gICAgLSB1cGRhdGUgdGhlIEFQSXMgbmFtaW5nIGFuZCBzb21lIG90aGVyIG1pbm9y
IGZpeGVzKFJhZmFlbCkNCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvYmFzZS9LY29uZmlnICB8ICAg
OCArKw0KPiA+ICAgZHJpdmVycy9iYXNlL01ha2VmaWxlIHwgICAxICsNCj4gPiAgIGRyaXZlcnMv
YmFzZS93YnJmLmMgICB8IDIyNw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgIGluY2x1ZGUvbGludXgvd2JyZi5oICB8ICA2NSArKysrKysrKysrKysN
Cj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMzAxIGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Jhc2Uvd2JyZi5jDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC93YnJmLmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jhc2Uv
S2NvbmZpZyBiL2RyaXZlcnMvYmFzZS9LY29uZmlnIGluZGV4DQo+ID4gMmI4ZmQ2YmI3ZGEwLi41
YjQ0MTAxN2IyMjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9iYXNlL0tjb25maWcNCj4gPiAr
KysgYi9kcml2ZXJzL2Jhc2UvS2NvbmZpZw0KPiA+IEBAIC0yNDIsNCArMjQyLDEyIEBAIGNvbmZp
ZyBGV19ERVZMSU5LX1NZTkNfU1RBVEVfVElNRU9VVA0KPiA+ICAgICAgIGNvbW1hbmQgbGluZSBv
cHRpb24gb24gZXZlcnkgc3lzdGVtL2JvYXJkIHlvdXIga2VybmVsIGlzIGV4cGVjdGVkDQo+IHRv
DQo+ID4gICAgICAgd29yayBvbi4NCj4gPg0KPiA+ICtjb25maWcgV0JSRg0KPiA+ICsgICBib29s
ICJXaWZpIGJhbmQgUkYgbWl0aWdhdGlvbiBtZWNoYW5pc20iDQo+ID4gKyAgIGRlZmF1bHQgbg0K
PiA+ICsgICBoZWxwDQo+ID4gKyAgICAgV2lmaSBiYW5kIFJGIG1pdGlnYXRpb24gbWVjaGFuaXNt
IGFsbG93cyBtdWx0aXBsZSBkcml2ZXJzIGZyb20NCj4gPiArICAgICBkaWZmZXJlbnQgZG9tYWlu
cyB0byBub3RpZnkgdGhlIGZyZXF1ZW5jaWVzIGluIHVzZSBzbyB0aGF0IGhhcmR3YXJlDQo+ID4g
KyAgICAgY2FuIGJlIHJlY29uZmlndXJlZCB0byBhdm9pZCBoYXJtb25pYyBjb25mbGljdHMuDQo+
ID4gKw0KPiA+ICAgZW5kbWVudQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jhc2UvTWFrZWZp
bGUgYi9kcml2ZXJzL2Jhc2UvTWFrZWZpbGUgaW5kZXgNCj4gPiAzMDc5YmZlNTNkMDQuLmM4NDRm
NjhhNjgzMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Jhc2UvTWFrZWZpbGUNCj4gPiArKysg
Yi9kcml2ZXJzL2Jhc2UvTWFrZWZpbGUNCj4gPiBAQCAtMjYsNiArMjYsNyBAQCBvYmotJChDT05G
SUdfR0VORVJJQ19NU0lfSVJRKSArPSBwbGF0Zm9ybS1tc2kubw0KPiA+ICAgb2JqLSQoQ09ORklH
X0dFTkVSSUNfQVJDSF9UT1BPTE9HWSkgKz0gYXJjaF90b3BvbG9neS5vDQo+ID4gICBvYmotJChD
T05GSUdfR0VORVJJQ19BUkNIX05VTUEpICs9IGFyY2hfbnVtYS5vDQo+ID4gICBvYmotJChDT05G
SUdfQUNQSSkgKz0gcGh5c2ljYWxfbG9jYXRpb24ubw0KPiA+ICtvYmotJChDT05GSUdfV0JSRikg
Kz0gd2JyZi5vDQo+ID4NCj4gPiAgIG9iai15ICAgICAgICAgICAgICAgICAgICAgKz0gdGVzdC8N
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jhc2Uvd2JyZi5jIGIvZHJpdmVycy9iYXNl
L3dicmYuYyBuZXcgZmlsZSBtb2RlDQo+ID4gMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4uMjE2
M2E4ZWM4YTlhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvYmFzZS93YnJm
LmMNCj4gPiBAQCAtMCwwICsxLDIyNyBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBXaWZpIEJhbmQgRXhjbHVzaW9uIEludGVyZmFj
ZQ0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgQWR2YW5jZWQgTWljcm8gRGV2aWNlcw0KPiA+
ICsgKg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC93YnJmLmg+DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgQkxPQ0tJTkdfTk9USUZJRVJfSEVBRCh3YnJmX2NoYWluX2hlYWQpOw0K
PiA+ICtzdGF0aWMgREVGSU5FX01VVEVYKHdicmZfbXV0ZXgpOw0KPiA+ICtzdGF0aWMgc3RydWN0
IGV4Y2x1c2lvbl9yYW5nZV9wb29sIHdicmZfcG9vbDsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQg
X3dicmZfYWRkX2V4Y2x1c2lvbl9yYW5nZXMoc3RydWN0IHdicmZfcmFuZ2VzX2luICppbikgew0K
PiA+ICsgICBpbnQgaSwgajsNCj4gPiArDQo+ID4gKyAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKGluLT5iYW5kX2xpc3QpOyBpKyspIHsNCj4gPiArICAgICAgICAgICBpZiAoIWluLT5iYW5k
X2xpc3RbaV0uc3RhcnQgJiYNCj4gPiArICAgICAgICAgICAgICAgIWluLT5iYW5kX2xpc3RbaV0u
ZW5kKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gKw0KPiA+ICsgICAg
ICAgICAgIGZvciAoaiA9IDA7IGogPCBBUlJBWV9TSVpFKHdicmZfcG9vbC5iYW5kX2xpc3QpOyBq
KyspIHsNCj4gPiArICAgICAgICAgICAgICAgICAgIGlmICh3YnJmX3Bvb2wuYmFuZF9saXN0W2pd
LnN0YXJ0ID09IGluLQ0KPiA+YmFuZF9saXN0W2ldLnN0YXJ0ICYmDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgd2JyZl9wb29sLmJhbmRfbGlzdFtqXS5lbmQgPT0gaW4tPmJhbmRfbGlzdFtp
XS5lbmQpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgd2JyZl9wb29sLnJlZl9j
b3VudGVyW2pdKys7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgIH0NCj4gPiArICAgICAgICAg
ICBpZiAoaiA8IEFSUkFZX1NJWkUod2JyZl9wb29sLmJhbmRfbGlzdCkpDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgZm9yIChqID0gMDsg
aiA8IEFSUkFZX1NJWkUod2JyZl9wb29sLmJhbmRfbGlzdCk7IGorKykgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgaWYgKCF3YnJmX3Bvb2wuYmFuZF9saXN0W2pdLnN0YXJ0ICYmDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgIXdicmZfcG9vbC5iYW5kX2xpc3Rbal0uZW5kKSB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIHdicmZfcG9vbC5iYW5kX2xpc3Rbal0uc3RhcnQg
PSBpbi0NCj4gPmJhbmRfbGlzdFtpXS5zdGFydDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgd2JyZl9wb29sLmJhbmRfbGlzdFtqXS5lbmQgPSBpbi0NCj4gPmJhbmRfbGlzdFtpXS5l
bmQ7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHdicmZfcG9vbC5yZWZfY291bnRl
cltqXSA9IDE7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICBp
ZiAoaiA+PSBBUlJBWV9TSVpFKHdicmZfcG9vbC5iYW5kX2xpc3QpKQ0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9TUEM7DQo+ID4gKyAgIH0NCj4gPiArDQo+ID4gKyAgIHJldHVy
biAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF93YnJmX3JlbW92ZV9leGNsdXNp
b25fcmFuZ2VzKHN0cnVjdCB3YnJmX3Jhbmdlc19pbiAqaW4pIHsNCj4gPiArICAgaW50IGksIGo7
DQo+ID4gKw0KPiA+ICsgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpbi0+YmFuZF9saXN0
KTsgaSsrKSB7DQo+ID4gKyAgICAgICAgICAgaWYgKCFpbi0+YmFuZF9saXN0W2ldLnN0YXJ0ICYm
DQo+ID4gKyAgICAgICAgICAgICAgICFpbi0+YmFuZF9saXN0W2ldLmVuZCkNCj4gPiArICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4gPiArICAgICAgICAgICBmb3IgKGogPSAw
OyBqIDwgQVJSQVlfU0laRSh3YnJmX3Bvb2wuYmFuZF9saXN0KTsgaisrKSB7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICBpZiAod2JyZl9wb29sLmJhbmRfbGlzdFtqXS5zdGFydCA9PSBpbi0NCj4g
PmJhbmRfbGlzdFtpXS5zdGFydCAmJg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHdicmZf
cG9vbC5iYW5kX2xpc3Rbal0uZW5kID09IGluLT5iYW5kX2xpc3RbaV0uZW5kKSB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHdicmZfcG9vbC5yZWZfY291bnRlcltqXS0tOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXdicmZfcG9vbC5yZWZfY291bnRlcltq
XSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdicmZfcG9vbC5i
YW5kX2xpc3Rbal0uc3RhcnQgPSAwOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHdicmZfcG9vbC5iYW5kX2xpc3Rbal0uZW5kID0gMDsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsN
Cj4gPiArICAgICAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICB9DQo+ID4gKyAgIH0N
Cj4gPiArDQo+ID4gKyAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IF93YnJmX3JldHJpZXZlX2V4Y2x1c2lvbl9yYW5nZXMoc3RydWN0IHdicmZfcmFuZ2VzX291dA0K
PiA+ICsqb3V0KSB7DQo+ID4gKyAgIGludCBvdXRfaWR4ID0gMDsNCj4gPiArICAgaW50IGk7DQo+
ID4gKw0KPiA+ICsgICBtZW1zZXQob3V0LCAwLCBzaXplb2YoKm91dCkpOw0KPiA+ICsNCj4gPiAr
ICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUod2JyZl9wb29sLmJhbmRfbGlzdCk7IGkrKykg
ew0KPiA+ICsgICAgICAgICAgIGlmICghd2JyZl9wb29sLmJhbmRfbGlzdFtpXS5zdGFydCAmJg0K
PiA+ICsgICAgICAgICAgICAgICAhd2JyZl9wb29sLmJhbmRfbGlzdFtpXS5lbmQpDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgb3V0LT5i
YW5kX2xpc3Rbb3V0X2lkeF0uc3RhcnQgPSB3YnJmX3Bvb2wuYmFuZF9saXN0W2ldLnN0YXJ0Ow0K
PiA+ICsgICAgICAgICAgIG91dC0+YmFuZF9saXN0W291dF9pZHgrK10uZW5kID0gd2JyZl9wb29s
LmJhbmRfbGlzdFtpXS5lbmQ7DQo+ID4gKyAgIH0NCj4gPiArDQo+ID4gKyAgIHJldHVybiAwOw0K
PiA+ICt9DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogd2JyZl9zdXBwb3J0ZWRfcHJvZHVjZXIg
LSBEZXRlcm1pbmUgaWYgdGhlIGRldmljZSBjYW4gcmVwb3J0DQo+ID4gK2ZyZXF1ZW5jaWVzDQo+
ID4gKyAqDQo+ID4gKyAqIEBkZXY6IGRldmljZSBwb2ludGVyDQo+ID4gKyAqDQo+ID4gKyAqIFdC
UkYgaXMgdXNlZCB0byBtaXRpZ2F0ZSBkZXZpY2VzIHRoYXQgY2F1c2UgaGFybW9uaWMgaW50ZXJm
ZXJlbmNlLg0KPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgZGV0ZXJtaW5lIGlmIHRoaXMgZGV2
aWNlIG5lZWRzIHRvIHJlcG9ydCBzdWNoDQo+IGZyZXF1ZW5jaWVzLg0KPiA+ICsgKi8NCj4gPiAr
Ym9vbCB3YnJmX3N1cHBvcnRlZF9wcm9kdWNlcihzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4gPiAr
ICAgcmV0dXJuIHRydWU7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwod2JyZl9zdXBw
b3J0ZWRfcHJvZHVjZXIpOw0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHdicmZfYWRkX2V4Y2x1
c2lvbiAtIEFkZCBmcmVxdWVuY3kgcmFuZ2VzIHRvIHRoZSBleGNsdXNpb24gbGlzdA0KPiA+ICsg
Kg0KPiA+ICsgKiBAZGV2OiBkZXZpY2UgcG9pbnRlcg0KPiA+ICsgKiBAaW46IGlucHV0IHN0cnVj
dHVyZSBjb250YWluaW5nIHRoZSBmcmVxdWVuY3kgcmFuZ2VzIHRvIGJlIGFkZGVkDQo+ID4gKyAq
DQo+ID4gKyAqIEFkZCBmcmVxdWVuY2llcyBpbnRvIHRoZSBleGNsdXNpb24gbGlzdCBmb3Igc3Vw
cG9ydGVkIGNvbnN1bWVycw0KPiA+ICsgKiB0byByZWFjdCB0by4NCj4gPiArICovDQo+ID4gK2lu
dCB3YnJmX2FkZF9leGNsdXNpb24oc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICBzdHJ1Y3Qgd2JyZl9yYW5nZXNfaW4gKmluKQ0KPiA+ICt7DQo+ID4gKyAgIGludCBy
Ow0KPiA+ICsNCj4gPiArICAgbXV0ZXhfbG9jaygmd2JyZl9tdXRleCk7DQo+ID4gKw0KPiA+ICsg
ICByID0gX3dicmZfYWRkX2V4Y2x1c2lvbl9yYW5nZXMoaW4pOw0KPiA+ICsNCj4gPiArICAgbXV0
ZXhfdW5sb2NrKCZ3YnJmX211dGV4KTsNCj4gPiArICAgaWYgKHIpDQo+ID4gKyAgICAgICAgICAg
cmV0dXJuIHI7DQo+ID4gKw0KPiA+ICsgICBibG9ja2luZ19ub3RpZmllcl9jYWxsX2NoYWluKCZ3
YnJmX2NoYWluX2hlYWQsIFdCUkZfQ0hBTkdFRCwNCj4gTlVMTCk7DQo+ID4gKw0KPiA+ICsgICBy
ZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTCh3YnJmX2FkZF9leGNsdXNp
b24pOw0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHdicmZfcmVtb3ZlX2V4Y2x1c2lvbiAtIFJl
bW92ZSBmcmVxdWVuY3kgcmFuZ2VzIGZyb20gdGhlIGV4Y2x1c2lvbg0KPiA+ICtsaXN0DQo+ID4g
KyAqDQo+ID4gKyAqIEBkZXY6IGRldmljZSBwb2ludGVyDQo+ID4gKyAqIEBpbjogaW5wdXQgc3Ry
dWN0dXJlIGNvbnRhaW5pbmcgdGhlIGZyZXF1ZW5jeSByYW5nZXMgdG8gYmUgcmVtb3ZlZA0KPiA+
ICsgKg0KPiA+ICsgKiBSZW1vdmUgZnJlcXVlbmNpZXMgZnJvbSB0aGUgZXhjbHVzaW9uIGxpc3Qg
Zm9yIHN1cHBvcnRlZCBjb25zdW1lcnMNCj4gPiArICogdG8gcmVhY3QgdG8uDQo+ID4gKyAqLw0K
PiA+ICtpbnQgd2JyZl9yZW1vdmVfZXhjbHVzaW9uKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHdicmZfcmFuZ2VzX2luICppbikNCj4gPiArew0K
PiA+ICsgICBpbnQgcjsNCj4gPiArDQo+ID4gKyAgIG11dGV4X2xvY2soJndicmZfbXV0ZXgpOw0K
PiA+ICsNCj4gPiArICAgciA9IF93YnJmX3JlbW92ZV9leGNsdXNpb25fcmFuZ2VzKGluKTsNCj4g
PiArDQo+ID4gKyAgIG11dGV4X3VubG9jaygmd2JyZl9tdXRleCk7DQo+ID4gKyAgIGlmIChyKQ0K
PiA+ICsgICAgICAgICAgIHJldHVybiByOw0KPiA+ICsNCj4gPiArICAgYmxvY2tpbmdfbm90aWZp
ZXJfY2FsbF9jaGFpbigmd2JyZl9jaGFpbl9oZWFkLCBXQlJGX0NIQU5HRUQsDQo+IE5VTEwpOw0K
PiA+ICsNCj4gPiArICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwo
d2JyZl9yZW1vdmVfZXhjbHVzaW9uKTsNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiB3YnJmX3N1
cHBvcnRlZF9jb25zdW1lciAtIERldGVybWluZSBpZiB0aGUgZGV2aWNlIGNhbiByZWFjdCB0bw0K
PiA+ICtmcmVxdWVuY2llcw0KPiA+ICsgKg0KPiA+ICsgKiBAZGV2OiBkZXZpY2UgcG9pbnRlcg0K
PiA+ICsgKg0KPiA+ICsgKiBXQlJGIGlzIHVzZWQgdG8gbWl0aWdhdGUgZGV2aWNlcyB0aGF0IGNh
dXNlIGhhcm1vbmljIGludGVyZmVyZW5jZS4NCj4gPiArICogVGhpcyBmdW5jdGlvbiB3aWxsIGRl
dGVybWluZSBpZiB0aGlzIGRldmljZSBuZWVkcyB0byByZWFjdCB0bw0KPiA+ICtyZXBvcnRzIGZy
b20NCj4gPiArICogb3RoZXIgZGV2aWNlcyBmb3Igc3VjaCBmcmVxdWVuY2llcy4NCj4gPiArICov
DQo+ID4gK2Jvb2wgd2JyZl9zdXBwb3J0ZWRfY29uc3VtZXIoc3RydWN0IGRldmljZSAqZGV2KSB7
DQo+ID4gKyAgIHJldHVybiB0cnVlOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHdi
cmZfc3VwcG9ydGVkX2NvbnN1bWVyKTsNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiB3YnJmX3Jl
Z2lzdGVyX25vdGlmaWVyIC0gUmVnaXN0ZXIgZm9yIG5vdGlmaWNhdGlvbnMgb2YgZnJlcXVlbmN5
DQo+ID4gK2NoYW5nZXMNCj4gPiArICoNCj4gPiArICogQG5iOiBkcml2ZXIgbm90aWZpZXIgYmxv
Y2sNCj4gPiArICoNCj4gPiArICogV0JSRiBpcyB1c2VkIHRvIG1pdGlnYXRlIGRldmljZXMgdGhh
dCBjYXVzZSBoYXJtb25pYyBpbnRlcmZlcmVuY2UuDQo+ID4gKyAqIFRoaXMgZnVuY3Rpb24gd2ls
bCBhbGxvdyBjb25zdW1lcnMgdG8gcmVnaXN0ZXIgZm9yIGZyZXF1ZW5jeSBub3RpZmljYXRpb25z
Lg0KPiA+ICsgKi8NCj4gPiAraW50IHdicmZfcmVnaXN0ZXJfbm90aWZpZXIoc3RydWN0IG5vdGlm
aWVyX2Jsb2NrICpuYikgew0KPiA+ICsgICByZXR1cm4gYmxvY2tpbmdfbm90aWZpZXJfY2hhaW5f
cmVnaXN0ZXIoJndicmZfY2hhaW5faGVhZCwgbmIpOyB9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BM
KHdicmZfcmVnaXN0ZXJfbm90aWZpZXIpOw0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIHdicmZf
dW5yZWdpc3Rlcl9ub3RpZmllciAtIFVucmVnaXN0ZXIgZm9yIG5vdGlmaWNhdGlvbnMgb2YNCj4g
PiArZnJlcXVlbmN5IGNoYW5nZXMNCj4gPiArICoNCj4gPiArICogQG5iOiBkcml2ZXIgbm90aWZp
ZXIgYmxvY2sNCj4gPiArICoNCj4gPiArICogV0JSRiBpcyB1c2VkIHRvIG1pdGlnYXRlIGRldmlj
ZXMgdGhhdCBjYXVzZSBoYXJtb25pYyBpbnRlcmZlcmVuY2UuDQo+ID4gKyAqIFRoaXMgZnVuY3Rp
b24gd2lsbCBhbGxvdyBjb25zdW1lcnMgdG8gdW5yZWdpc3RlciBmb3IgZnJlcXVlbmN5DQo+IG5v
dGlmaWNhdGlvbnMuDQo+ID4gKyAqLw0KPiA+ICtpbnQgd2JyZl91bnJlZ2lzdGVyX25vdGlmaWVy
KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIpIHsNCj4gPiArICAgcmV0dXJuIGJsb2NraW5nX25v
dGlmaWVyX2NoYWluX3VucmVnaXN0ZXIoJndicmZfY2hhaW5faGVhZCwgbmIpOyB9DQo+ID4gK0VY
UE9SVF9TWU1CT0xfR1BMKHdicmZfdW5yZWdpc3Rlcl9ub3RpZmllcik7DQo+ID4gKw0KPiA+ICsv
KioNCj4gPiArICogd2JyZl9yZXRyaWV2ZV9leGNsdXNpb25zIC0gUmV0cmlldmUgdGhlIGV4Y2x1
c2lvbiBsaXN0DQo+ID4gKyAqDQo+ID4gKyAqIEBkZXY6IGRldmljZSBwb2ludGVyDQo+ID4gKyAq
IEBvdXQ6IG91dHB1dCBzdHJ1Y3R1cmUgY29udGFpbmluZyB0aGUgZnJlcXVlbmN5IHJhbmdlcyB0
byBiZQ0KPiA+ICtleGNsdWRlZA0KPiA+ICsgKg0KPiA+ICsgKiBSZXRyaWV2ZSB0aGUgY3VycmVu
dCBleGNsdXNpb24gbGlzdCAgKi8gaW50DQo+ID4gK3dicmZfcmV0cmlldmVfZXhjbHVzaW9ucyhz
dHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB3
YnJmX3Jhbmdlc19vdXQgKm91dCkNCj4gPiArew0KPiA+ICsgICBpbnQgcjsNCj4gPiArDQo+ID4g
KyAgIG11dGV4X2xvY2soJndicmZfbXV0ZXgpOw0KPiA+ICsNCj4gPiArICAgciA9IF93YnJmX3Jl
dHJpZXZlX2V4Y2x1c2lvbl9yYW5nZXMob3V0KTsNCj4gPiArDQo+ID4gKyAgIG11dGV4X3VubG9j
aygmd2JyZl9tdXRleCk7DQo+ID4gKw0KPiA+ICsgICByZXR1cm4gcjsNCj4gPiArfQ0KPiA+ICtF
WFBPUlRfU1lNQk9MX0dQTCh3YnJmX3JldHJpZXZlX2V4Y2x1c2lvbnMpOw0KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3dicmYuaCBiL2luY2x1ZGUvbGludXgvd2JyZi5oIG5ldyBmaWxl
IG1vZGUNCj4gPiAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi4zY2E5NTc4NmNlZjUNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC93YnJmLmgNCj4gPiBAQCAtMCww
ICsxLDY1IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovDQo+
ID4gKy8qDQo+ID4gKyAqIFdpZmkgQmFuZCBFeGNsdXNpb24gSW50ZXJmYWNlDQo+ID4gKyAqIENv
cHlyaWdodCAoQykgMjAyMyBBZHZhbmNlZCBNaWNybyBEZXZpY2VzICAqLw0KPiA+ICsNCj4gPiAr
I2lmbmRlZiBfTElOVVhfV0JSRl9IDQo+ID4gKyNkZWZpbmUgX0xJTlVYX1dCUkZfSA0KPiA+ICsN
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KPiA+ICsNCj4gPiArLyogTWF4aW11bSBu
dW1iZXIgb2Ygd2JyZiByYW5nZXMgKi8NCj4gPiArI2RlZmluZSBNQVhfTlVNX09GX1dCUkZfUkFO
R0VTICAgICAgICAgICAgIDExDQo+ID4gKw0KPiA+ICtzdHJ1Y3QgZXhjbHVzaW9uX3JhbmdlIHsN
Cj4gPiArICAgLyogc3RhcnQgYW5kIGVuZCBwb2ludCBvZiB0aGUgZnJlcXVlbmN5IHJhbmdlIGlu
IEh6ICovDQo+ID4gKyAgIHVpbnQ2NF90ICAgICAgICBzdGFydDsNCj4gPiArICAgdWludDY0X3Qg
ICAgICAgIGVuZDsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0cnVjdCBleGNsdXNpb25fcmFuZ2Vf
cG9vbCB7DQo+ID4gKyAgIHN0cnVjdCBleGNsdXNpb25fcmFuZ2UgIGJhbmRfbGlzdFtNQVhfTlVN
X09GX1dCUkZfUkFOR0VTXTsNCj4gPiArICAgdWludDY0X3QNCj4gICAgICAgcmVmX2NvdW50ZXJb
TUFYX05VTV9PRl9XQlJGX1JBTkdFU107DQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdHJ1Y3Qgd2Jy
Zl9yYW5nZXNfaW4gew0KPiA+ICsgICAvKiB2YWxpZCBlbnRyeTogYHN0YXJ0YCBhbmQgYGVuZGAg
ZmlsbGVkIHdpdGggbm9uLXplcm8gdmFsdWVzICovDQo+ID4gKyAgIHN0cnVjdCBleGNsdXNpb25f
cmFuZ2UgIGJhbmRfbGlzdFtNQVhfTlVNX09GX1dCUkZfUkFOR0VTXTsNCj4gPiArfTsNCj4gPiAr
DQo+ID4gK3N0cnVjdCB3YnJmX3Jhbmdlc19vdXQgew0KPiA+ICsgICB1aW50MzJfdCAgICAgICAg
ICAgICAgICBudW1fb2ZfcmFuZ2VzOw0KPiA+ICsgICBzdHJ1Y3QgZXhjbHVzaW9uX3JhbmdlICBi
YW5kX2xpc3RbTUFYX05VTV9PRl9XQlJGX1JBTkdFU107DQo+ID4gK30gX19wYWNrZWQ7DQo+ID4g
Kw0KPiA+ICtlbnVtIHdicmZfbm90aWZpZXJfYWN0aW9ucyB7DQo+ID4gKyAgIFdCUkZfQ0hBTkdF
RCwNCj4gPiArfTsNCj4gPiArDQo+ID4gKyNpZmRlZiBDT05GSUdfV0JSRg0KPiA+ICtib29sIHdi
cmZfc3VwcG9ydGVkX3Byb2R1Y2VyKHN0cnVjdCBkZXZpY2UgKmRldik7IGludA0KPiA+ICt3YnJm
X2FkZF9leGNsdXNpb24oc3RydWN0IGRldmljZSAqYWRldiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgc3RydWN0IHdicmZfcmFuZ2VzX2luICppbik7DQo+ID4gK2ludCB3YnJmX3JlbW92ZV9leGNs
dXNpb24oc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3Qgd2JyZl9yYW5nZXNfaW4gKmluKTsNCj4gPiAraW50IHdicmZfcmV0cmlldmVfZXhjbHVzaW9u
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCB3YnJmX3Jhbmdlc19vdXQgKm91dCk7IGJvb2wNCj4gPiArd2JyZl9zdXBwb3J0ZWRfY29uc3Vt
ZXIoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiArDQo+ID4gK2ludCB3YnJmX3JlZ2lzdGVyX25v
dGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIpOyBpbnQNCj4gPiArd2JyZl91bnJlZ2lz
dGVyX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIpOyAjZWxzZSBzdGF0aWMNCj4g
PiAraW5saW5lIGJvb2wgd2JyZl9zdXBwb3J0ZWRfcHJvZHVjZXIoc3RydWN0IGRldmljZSAqZGV2
KSB7IHJldHVybg0KPiA+ICtmYWxzZTsgfSBzdGF0aWMgaW5saW5lIGludCB3YnJmX2FkZF9leGNs
dXNpb24oc3RydWN0IGRldmljZSAqYWRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3Qgd2JyZl9yYW5nZXNfaW4gKmluKSB7IHJldHVybiAtDQo+IEVOT0RFVjsg
fSBzdGF0aWMgaW5saW5lDQo+ID4gK2ludCB3YnJmX3JlbW92ZV9leGNsdXNpb24oc3RydWN0IGRl
dmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCB3YnJmX3Jhbmdlc19pbiAqaW4pIHsgcmV0dXJuIC0NCj4gRU5PREVWOyB9IHN0YXRpYyBpbmxp
bmUgaW50DQo+ID4gK3dicmZfcmV0cmlldmVfZXhjbHVzaW9ucyhzdHJ1Y3QgZGV2aWNlICpkZXYs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHdicmZf
cmFuZ2VzX291dCAqb3V0KQ0KPiB7IHJldHVybiAtRU5PREVWOyB9IHN0YXRpYw0KPiA+ICtpbmxp
bmUgYm9vbCB3YnJmX3N1cHBvcnRlZF9jb25zdW1lcihzdHJ1Y3QgZGV2aWNlICpkZXYpIHsgcmV0
dXJuDQo+ID4gK2ZhbHNlOyB9IHN0YXRpYyBpbmxpbmUgaW50IHdicmZfcmVnaXN0ZXJfbm90aWZp
ZXIoc3RydWN0DQo+ID4gK25vdGlmaWVyX2Jsb2NrICpuYikgeyByZXR1cm4gLUVOT0RFVjsgfSBz
dGF0aWMgaW5saW5lIGludA0KPiA+ICt3YnJmX3VucmVnaXN0ZXJfbm90aWZpZXIoc3RydWN0IG5v
dGlmaWVyX2Jsb2NrICpuYikgeyByZXR1cm4gLUVOT0RFVjsNCj4gPiArfSAjZW5kaWYNCj4gPiAr
DQo+DQo+IFJpZ2h0IG5vdyB0aGVyZSBhcmUgc3R1YnMgZm9yIG5vbiBDT05GSUdfV0JSRiBhcyB3
ZWxsIGFzIG90aGVyIHBhdGNoZXMgYXJlDQo+IHVzaW5nICNpZmRlZiBDT05GSUdfV0JSRiBvciBo
YXZpbmcgdGhlaXIgb3duIHN0dWJzLiAgTGlrZSBtYWM4MDIxMSBwYXRjaA0KPiBsb29rcyBmb3Ig
I2lmZGVmIENPTkZJR19XQlJGLg0KPg0KPiBJIHRoaW5rIHdlIHNob3VsZCBwaWNrIG9uZSBvciB0
aGUgb3RoZXIuDQpSaWdodC4uDQo+DQo+IEhhdmluZyBvdGhlciBzdWJzeXN0ZW1zICNpZmRlZiBD
T05GSUdfV0JSRiB3aWxsIG1ha2UgdGhlIHNlcmllcyBlYXNpZXIgdG8NCj4gbGFuZCB0aHJvdWdo
IG11bHRpcGxlIHRyZWVzOyBzbyBJIGhhdmUgYSBzbGlnaHQgbGVhbmluZyBpbiB0aGF0IGRpcmVj
dGlvbi4NCkkga2luZCBvZiBleHBlY3RpbmcgdG8gdXNlIHRoZSBvdGhlciB3YXkuIFRoYXQgaXMg
dG8gbWFrZSBDT05GSUdfV0JSRiBhZ25vc3RpYyB0byBvdGhlciBzdWJzeXN0ZW1zIG9yIGRyaXZl
cnMuDQpUaGV5IChvdGhlciBzdWJzeXN0ZW1zIG9yIGRyaXZlcnMpIGNhbiBhbHdheXMgYXNzdW1l
IHRob3NlIHdicmZfeHh4eHggaW50ZXJmYWNlcyBhcmUgYXZhaWxhYmxlLg0KV2hhdCB0aGV5IG5l
ZWQgdG8gY2FyZSBvbmx5IGFyZSB0aGUgcmV0dXJuIHZhbHVlcyBvZiB0aG9zZSBpbnRlcmZhY2Vz
Lg0KSG93IGRvIHlvdSB0aGluaz8NCg0KRXZhbg0KPg0KPiA+ICsjZW5kaWYgLyogX0xJTlVYX1dC
UkZfSCAqLw0KDQo=
