Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEBD80F99F
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Dec 2023 22:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513EA10E6C9;
	Tue, 12 Dec 2023 21:44:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8384B10E6C9
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Dec 2023 21:44:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5ctfjjwcuQfQWKzBsh4ksp88SwOg+tJGuJp7Hkdqziu8lxDX7rJyG/PAQMQYAJUNVKdRuC26ViHnN2kWu9gu4F81vKj+jDV2dMGmw+StWT0/J5/A/MF3q90VGqtmYNGjV6/TF6WpqqHOUJW/+Tnj/br+R9P5VF0bLkPal3YIySqd+6XNXvGOfgn4oRjvHEGvIa/KUDCdSvBI6Md+G1bFn8YeQVqpGC3TjQp8NMkJc09VV0xfU54vBF8dKO5p145TDgZE1k+SWcMvUFKn7mwv4oHDa1JbGkSp1hmuO0y2h8JvCAnM/bLZ7dzmIjB36i2d3hO/jtcF5kCXxZGQIHxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIuNryN9S/uQkgnlxQWNK2vxYJPjii/vRFsM7H/fZuo=;
 b=lx/dLB4Q/2UMSgzgZi0WChCUnd7Ggo2KTV9b4HNrhdKY3JuFtLLbL1uWN+iDZpxbrsOjWyeOgsm96hVGF4R2Jv1k+KjPTNj2KDECgczcj1YjIlf/Hd2jSGpIINRWOlvmtoCAvyEPCKlRlXxZtLWD2BavfWyklRBT3kkyxHIo0J4Oc7FUFqbl4suB1lxvj2wSn89uuv8e+s4TEviaWlyIxY/cBXIa6sJA1dXxBz37vOh90GReXl8BugGFGN9ykfDCpinyOxbO6wTevZkjqKiMDSgJ+7Ld61TauWnj1uKQMb4aQeBB/MAzNU37A64o6HzMTruT1b8A28U5gSPZ1JlLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIuNryN9S/uQkgnlxQWNK2vxYJPjii/vRFsM7H/fZuo=;
 b=SU8MeDduG1kRPQTyUyqM1ljf9Ix3xXoXBYUuwMLqH2ZV59wVQrrRNK5voJrzw1hKGUMmkSlymnR7dUboI8r8xCnVamwhC7v/Ba4soAglZTc6qEBvVnNDEMWTbjhVXwpbUu7KCnBElFozKgVU/tgOHldaAqMzsfEMEpRe4nbgmEs=
Received: from CH0PR12MB5372.namprd12.prod.outlook.com (2603:10b6:610:d7::10)
 by SA0PR12MB4527.namprd12.prod.outlook.com (2603:10b6:806:73::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 21:44:50 +0000
Received: from CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::28b7:3ee9:2c4b:6ae]) by CH0PR12MB5372.namprd12.prod.outlook.com
 ([fe80::28b7:3ee9:2c4b:6ae%7]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 21:44:49 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "Huang, JinHuiEric"
 <JinHuiEric.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process management
Thread-Topic: [PATCH] drm/amdkfd: fix mes set shader debugger process
 management
Thread-Index: AQHaLHdTu1pi6XN9kEyuJkcz/NdpHLCl7iQAgAAzU6CAAAsuAIAAAaNQ
Date: Tue, 12 Dec 2023 21:44:49 +0000
Message-ID: <CH0PR12MB5372602539AA4398F2ED5822F48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
References: <20231211211612.3109-1-Jonathan.Kim@amd.com>
 <c4fc2b14-07b1-4b27-b460-166dcb343d74@amd.com>
 <CH0PR12MB5372AA024278ED7F7F078EEFF48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB7435E109E255C480398C0FE4858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB7435E109E255C480398C0FE4858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1f974d48-b7bc-4742-955d-811359e16bc1;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-12-12T21:31:14Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5372:EE_|SA0PR12MB4527:EE_
x-ms-office365-filtering-correlation-id: 03c7f36a-e154-4eee-3e3c-08dbfb5b90df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WSsvHjxFX/JqytlbLK4r0PLZKF59U9KrM7P1hxX1kiZAZIjqQ78Ai4GX4Ll0a5mwlAswUmBTBnc/q94AJcUeAdUA+saCUI/0KvuXg1mjrzC/p8RU4mjpxnV1AMp3i9CXWpJH2yU1JHhDPG+3+y+szFhsSKACdW/ZH/sdbGCqfSiUPgfqEZbB1uyfqqklhc//JuJycMlju7BdR/L/z8iJSIGi5zbTXhVoirIAz3XqH7Z8Wskf8I5zTbc7RHwPCTiRo4syVbMJtI5OF58trHZDz4hFNaaSULIHZDhEnezqrWqm4Nv2iayCE7/MtMereexVdO0ROGKbIkjiUnfKaVzCJquMhPmeY5RtNgVyxi2KnCTJu/xtVi0XDn+2T+2lfC3ytL5b23nk+phr8oO3dxYHc3EHSQHZkhxR/7eC2ATz/ucl7J8midnyaU8tV7+EaStFWDtLsIuAqkNcXKNBKeuHMnc4GDnmOZv6Jy4lV53qkgS91QVA5UINrsAGQA/5umYzOBHKaz8Hsm3N1crU4hOSaPNa/pmBUV6LUPSEjuiPf//ksS+0aeYwFRL1PIvNhvxl0N4m31K6IKMV95cUAhOijedf49uJFcxdGbbyZ9lhPjDfNgNpgVzrvCRD+bXpWNl9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5372.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8936002)(8676002)(41300700001)(2906002)(4326008)(52536014)(5660300002)(4001150100001)(38070700009)(478600001)(122000001)(53546011)(83380400001)(26005)(71200400001)(33656002)(6506007)(7696005)(9686003)(64756008)(54906003)(110136005)(316002)(86362001)(66946007)(66446008)(66556008)(76116006)(66476007)(55016003)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkdYa0lFbnlzZlMrUnR1QlVnOUcrVXcremlsT3psQkJDYWxlSWR0aFpIbjRq?=
 =?utf-8?B?M25ZMGFBcHlGbFd0cERFdGppbHo2UU9nWENLR2ZtNk1iNXphbVUyQmx3bTA2?=
 =?utf-8?B?eDMxNk45b1hKTW00Tk9raVp1c3dBSnBHN09PWVl4STk5SkZJWWdlVlJxQldO?=
 =?utf-8?B?azVWeitnbWphcnFuYWdVWkFkSFEyZHZyVTBOWWN6UmIvblJZT1lHMDluczRD?=
 =?utf-8?B?QVFrS0xvS3QwSWNHaXZnKzU4Q29DRXFZOXVuRTVhL0V1ZC9CWXNMTmtjYmJP?=
 =?utf-8?B?NGtDSitGL25US01BazBWeU5oY1FESFVnay9qZktHSWFTNENLM09jUVlPRDNJ?=
 =?utf-8?B?dGsxQUc5ZW9DVmkwS1dTTEZkQ0NUUXNoVHV4am03OTh4UFJLMjZoYm44WmFJ?=
 =?utf-8?B?elhkb3doQTQ1SG52QTNTUGx5ZE1DNHE5SUNsMHcxNytxUEs4dU1VS3l5Ylhh?=
 =?utf-8?B?YU9Ta1VxUERsZU5RcW0zdkNLVFdKN044V0xRMUI3bWFFc2cwb25TS0lsM3lm?=
 =?utf-8?B?OEx4Q1BJQkgwTFkvRTNXbExLYjA2ajkvR1FZRlc3bHVOWVVrWXo5K0oxTTFi?=
 =?utf-8?B?YnhxU016QmJZcVZ4K1AwUGlRR004dW9zbVhBNmhNWDhacUlSOUJMQ0xUdllY?=
 =?utf-8?B?VTVOUzZSS1gzVWcwcXVKcnN3bHhCOUl6OXhKZEZmZFRCZ0tCZnFkWlFMRHph?=
 =?utf-8?B?Ym1Od21YeisyMVpxSGpHVGdSQUYrZWc3Mk53RGl5UUNpWGxRVHVvci9PelVB?=
 =?utf-8?B?emF4Vm0xemxVdGNVdXNlbnpJRUlROXhxOHR2MTRKQmlsL2F1UW1xamhYR2Y3?=
 =?utf-8?B?K1MrR3Z2UEI5dEZ4VDR3eDBzUnNtWi9XL05Pd09HKzYrZjB2d1VxdEVjUXU3?=
 =?utf-8?B?SVhFYVBXa1NDcUduS0xTaWtmelpJL1RSLzF2YVVOaFdyeVR0T1VnWUtHbkFC?=
 =?utf-8?B?RnBUSGFNVWpYbzZIMlR1NWkyTWpCUUVXRTQ1d1h1ZWxpMzZwZXdLMWVUREln?=
 =?utf-8?B?VDVyZjJTN0lYRFQ4WFZjMyt4UjVrSURSTlkvVTZwdVdrdmVtdFpVVi8zNVV3?=
 =?utf-8?B?QXdmbUhOZUtjWFJxUVZvSDlxUlBCdHpmdGY0Y1o0VjA5a2lhS3NBRUdCWFU5?=
 =?utf-8?B?ZHNqK1dHUEVTdWZnNFFoanRkWFkyM2d4YmF6YnA1RGpaU2N3SE9EQWRzYXdO?=
 =?utf-8?B?ZVdneExvKy8zeWxnLzJtazFJbUlscVRoUVd2bnQyNldtT0lXRGNkQnZyb0M2?=
 =?utf-8?B?RC90Nmtjd2hNTTNtQ3FialZwZVZnYVdWSENqSnZuNnFFVFZmbGdjc2JkMDVB?=
 =?utf-8?B?eURUR1hPdTJ1U2EyWE1sQUN6OTY5aFZ1b2YvM1Avb3ZiWm5BK2FWQXpRMmZJ?=
 =?utf-8?B?ODVyUGlZZHB6ZlJxNUZqV3R6S1J5bzlyRzdvWFlLYmgvSHcrY0tmTGYyMlF2?=
 =?utf-8?B?R2hRRlZBejFqUFVvaTlYZkxsTTNkV0k2aDhTWHdPK3ZuVzcySm9GQ0RjMTUw?=
 =?utf-8?B?UnVhWTNvZE1aRFZ4NjFvSExhVU1IRjRLeW1ROFRhSnI5VjZWeFlrMHlXRkVo?=
 =?utf-8?B?am1haEwxV0F5NGdHSWtGNWN3VGZBbnFWeTZQT2dUR2tzOFRHMWhKRkZWS01a?=
 =?utf-8?B?MWRDd0hHWDZLTUg4bCt3SDlYQ2FFZ1ZENkhxbWU5VU9ESHNqNXM3Y1dTbEVy?=
 =?utf-8?B?L1ZBMWpyYUtNN2V6WS9LNkpDNHg0ajRKT3BvWDI5V1JjTlJldE95OUFxTDE3?=
 =?utf-8?B?U0tYdWJFTmtlSk9LeXhyTEtISFVqRTFRb3prcUg1STZYN243bENvRVoycThj?=
 =?utf-8?B?YjJ5Wk1PMU5ZNjRHOU1JSzNmSUtzZkcxVmp1VkhScXh3VEVFRDFvcWJIT3FD?=
 =?utf-8?B?UHd4U2VCek05bDlab1R2eTdONjd3QWF0Mk15UFpEQ3h2MjlMUmF6bUZEM0ha?=
 =?utf-8?B?dFBiVjc3c3k5MFQrR2RPSTZaeUt0WGwxRzF2NVhvNEMyY1ROZ0NpdlVKeVdu?=
 =?utf-8?B?TjVuUUZBTHgwU1VuMWxwRkcxUjMrUkR2OXNCOWc4V3pKTHl6UzFLYWZ6dHBu?=
 =?utf-8?B?SlQwR2w0OVFNZXhEWTlWY2E4WjdQZ2RldVlHZGRINWpJNjBuZmMwVE1NaHVS?=
 =?utf-8?Q?RVTY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5372.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c7f36a-e154-4eee-3e3c-08dbfb5b90df
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 21:44:49.3759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AMrjfww8NIoGsNORct4MSxDm3d6poZ7MAG81jYhF9Q8HbtX/AQPrb8zsKHSucpqaSsZ+yP7ENH/AHaxFPgfO0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4527
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
Cc: "Wong, Alice" <Shiwei.Wong@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KU2hvdWxkbid0IHRoZSBkcml2ZXIgc2lkZSAgcmVtb3ZlIGFsbCB0aGUgcmVt
YWluaW5nICBxdWV1ZXMgZm9yIHRoZSBwcm9jZXNzIGR1cmluZyAgcHJvY2VzcyB0ZXJtaW5hdGlv
biA/ICBJZiBhbGwgdGhlICBxdWV1ZXMgYmVlbiByZW1vdmVkIGZvciB0aGUgcHJvY2VzcyAsICBN
RVMgc2hvdWxkIHB1cmdlIHRoZSAgcHJvY2VzcyBjb250ZXh0IGF1dG9tYXRpY2FsbHkgLCBvdGhl
cndpc2UgaXQncyBidWcgaW5zaWRlIE1FUyAuDQoNClJlZ2FyZA0KU3NoYW95dW4ubGl1DQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5L
aW1AYW1kLmNvbT4NClNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDEyLCAyMDIzIDQ6MzMgUE0NClRv
OiBMaXUsIFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+OyBIdWFuZywgSmluSHVpRXJpYyA8
SmluSHVpRXJpYy5IdWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBXb25nLCBBbGljZSA8U2hpd2VpLldvbmdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeCA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IEthc2l2aXN3YW5hdGhhbiwgSGFyaXNoIDxIYXJpc2gu
S2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1ka2Zk
OiBmaXggbWVzIHNldCBzaGFkZXIgZGVidWdnZXIgcHJvY2VzcyBtYW5hZ2VtZW50DQoNCltQdWJs
aWNdDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1LCBTaGFveXVu
IDxTaGFveXVuLkxpdUBhbWQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMiwgMjAy
MyA0OjAwIFBNDQo+IFRvOiBIdWFuZywgSmluSHVpRXJpYyA8SmluSHVpRXJpYy5IdWFuZ0BhbWQu
Y29tPjsgS2ltLCBKb25hdGhhbg0KPiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogV29uZywgQWxpY2UgPFNoaXdlaS5Xb25nQGFtZC5j
b20+OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLYXNpdmlz
d2FuYXRoYW4sIEhhcmlzaA0KPiA8SGFyaXNoLkthc2l2aXN3YW5hdGhhbkBhbWQuY29tPg0KPiBT
dWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1ka2ZkOiBmaXggbWVzIHNldCBzaGFkZXIgZGVidWdn
ZXIgcHJvY2Vzcw0KPiBtYW5hZ2VtZW50DQo+DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBH
ZW5lcmFsXQ0KPg0KPiBEb2VzIHRoaXMgcmVxdWlyZXMgdGhlICBuZXcgTUVTIEZXIGZvciB0aGlz
IHByb2Nlc3NfY3R4X2ZsdXNoDQo+IHJlcXVpcmVtZW50ID8gIENhbiBkcml2ZXIgc2lkZSBhZGQg
bG9naWMgdG8gZ3VhcmFudHkgd2hlbiAgY2FsbA0KPiBTRVRfU0hBREVSX0RFQlVHR0VSLCB0aGUg
cHJvY2VzcyBhZGRyZXNzICBpcyBhbHdheXMgdmFsaWQgPw0KDQpDYWxsIHRvIGZsdXNoIG9uIG9s
ZCBmdyBpcyBhIE5PUCBzbyBpdCdzIGhhcm1sZXNzIGluIHRoYXQgY2FzZS4NCkZ1bGwgc29sdXRp
b24gd2lsbCBzdGlsbCByZXF1aXJlIGEgbmV3IE1FUyB2ZXJzaW9uIGFzIHRoaXMgaXMgYSB3b3Jr
YXJvdW5kIG9uIGNvcm5lciBjYXNlcyBhbmQgbm90IGEgbmV3IGZlYXR1cmUgaS5lLiB3ZSBjYW4n
dCBzdG9wIFJPQ20gZnJvbSBydW5uaW5nIG9uIG9sZCBmdy4NClRoZSBwcm9jZXNzIGFkZHJlc3Mg
aXMgYWx3YXlzIHZhbGlkIGZyb20gdGhlIGRyaXZlciBzaWRlLiAgSXQncyB0aGUgTUVTIHNpZGUg
b2YgdGhpbmdzIHRoYXQgZ2V0cyBzdGFsZSBhcyBtZW50aW9uZWQgaW4gdGhlIGRlc2NyaXB0aW9u
IChwYXNzZWQgdmFsdWUgdG8gTUVTIGlzIHJldXNlZCB3aXRoIG5ldyBCTyBidXQgTUVTIGRvZXNu
J3QgcmVmcmVzaCkuDQppLmUuIE1FUyBhdXRvIHJlZnJlc2hlcyBpdCdzIHByb2Nlc3MgbGlzdCBh
c3N1bWluZyBwcm9jZXNzIHF1ZXVlcyB3ZXJlIGFsbCBkcmFpbmVkIGJ1dCBkcml2ZXIgY2FuJ3Qg
Z3VhcmFudGVlIHRoYXQgU0VUX1NIQURFUl9ERUJVR0dFUiAod2hpY2ggYWRkcyB0byBNRVMncyBw
cm9jZXNzIGxpc3QpIHdpbGwgZ2V0IGNhbGxlZCBhZnRlciBxdWV1ZXMgZ2V0IGFkZGVkIChpbiBm
YWN0IGl0J3MgYSByZXF1aXJlbWVudHMgdGhhdCBpdCBjYW4gYmUgY2FsbGVkIGF0IGFueSB0aW1l
KS4NCldlIGNhbiBhdHRlbXB0IHRvIGRlZmVyIGNhbGxzIHRoZXNlIGNhbGxzIGluIHRoZSBLRkQs
IGNvbnNpZGVyaW5nIGFsbCBjYXNlcy4NCkJ1dCB0aGF0IHdvdWxkIGJlIGEgbGFyZ2Ugc2hpZnQg
aW4gZGVidWdnZXIvcnVudGltZV9lbmFibGUvS0ZEIGNvZGUsIHdoaWNoIGlzIGFscmVhZHkgY29t
cGxpY2F0ZWQgYW5kIGNvdWxkIGdldCBidWdneSBwbHVzIGl0IHdvdWxkIG5vdCBiZSBpbnR1aXRp
dmUgYXQgYWxsIGFzIHRvIHdoeSB3ZSdyZSBkb2luZyB0aGlzLg0KSSB0aGluayBhIHNpbmdsZSBm
bGFnIHNldCB0byBmbHVzaCBNRVMgb24gcHJvY2VzcyB0ZXJtaW5hdGlvbiBpcyBhIHNpbXBsZXIg
Y29tcHJvbWlzZSB0aGF0IHNob3dzIHRoZSBsaW1pdGF0aW9uIGluIGEgbW9yZSBvYnZpb3VzIHdh
eS4NCg0KVGhhbmtzLA0KDQpKb24NCg0KDQo+DQo+IFJlZ2FyZHMNCj4gU2hhb3l1bi5saXUNCj4N
Cj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEVyaWMgSHVh
bmcNCj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMTIsIDIwMjMgMTI6NDkgUE0NCj4gVG86IEtp
bSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBXb25nLCBBbGljZSA8U2hpd2VpLldvbmdAYW1kLmNvbT47IEt1
ZWhsaW5nLCBGZWxpeA0KPiA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IEthc2l2aXN3YW5hdGhh
biwgSGFyaXNoDQo+IDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IGZpeCBtZXMgc2V0IHNoYWRlciBkZWJ1Z2dlciBwcm9j
ZXNzDQo+IG1hbmFnZW1lbnQNCj4NCj4NCj4gT24gMjAyMy0xMi0xMSAxNjoxNiwgSm9uYXRoYW4g
S2ltIHdyb3RlOg0KPiA+IE1FUyBwcm92aWRlcyB0aGUgZHJpdmVyIGEgY2FsbCB0byBleHBsaWNp
dGx5IGZsdXNoIHN0YWxlIHByb2Nlc3MNCj4gPiBtZW1vcnkgd2l0aGluIHRoZSBNRVMgdG8gYXZv
aWQgYSByYWNlIGNvbmRpdGlvbiB0aGF0IHJlc3VsdHMgaW4gYQ0KPiA+IGZhdGFsIG1lbW9yeSB2
aW9sYXRpb24uDQo+ID4NCj4gPiBXaGVuIFNFVF9TSEFERVJfREVCVUdHRVIgaXMgY2FsbGVkLCB0
aGUgZHJpdmVyIHBhc3NlcyBhIG1lbW9yeQ0KPiBhZGRyZXNzDQo+ID4gdGhhdCByZXByZXNlbnRz
IGEgcHJvY2VzcyBjb250ZXh0IGFkZHJlc3MgTUVTIHVzZXMgdG8ga2VlcCB0cmFjayBvZg0KPiA+
IGZ1dHVyZSBwZXItcHJvY2VzcyBjYWxscy4NCj4gPg0KPiA+IE5vcm1hbGx5LCBNRVMgd2lsbCBw
dXJnZSBpdHMgcHJvY2VzcyBjb250ZXh0IGxpc3Qgd2hlbiB0aGUgbGFzdA0KPiA+IHF1ZXVlIGhh
cyBiZWVuIHJlbW92ZWQuICBUaGUgZHJpdmVyLCBob3dldmVyLCBjYW4gY2FsbA0KPiA+IFNFVF9T
SEFERVJfREVCVUdHRVIgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGEgcXVldWUgaGFzIGJlZW4gYWRk
ZWQgb3Igbm90Lg0KPiA+DQo+ID4gSWYgU0VUX1NIQURFUl9ERUJVR0dFUiBoYXMgYmVlbiBjYWxs
ZWQgd2l0aCBubyBxdWV1ZXMgYXMgdGhlIGxhc3QNCj4gPiBjYWxsIHByaW9yIHRvIHByb2Nlc3Mg
dGVybWluYXRpb24sIHRoZSBwYXNzZWQgcHJvY2VzcyBjb250ZXh0DQo+ID4gYWRkcmVzcyB3aWxs
IHN0aWxsIHJlc2lkZSB3aXRoaW4gTUVTLg0KPiA+DQo+ID4gT24gYSBuZXcgcHJvY2VzcyBjYWxs
IHRvIFNFVF9TSEFERVJfREVCVUdHRVIsIHRoZSBkcml2ZXIgbWF5IGVuZCB1cA0KPiA+IHBhc3Np
bmcgYW4gaWRlbnRpY2FsIHByb2Nlc3MgY29udGV4dCBhZGRyZXNzIHZhbHVlIChiYXNlZCBvbg0K
PiA+IHBlci1wcm9jZXNzIGdwdSBtZW1vcnkgYWRkcmVzcykgdG8gTUVTIGJ1dCBpcyBub3cgcG9p
bnRpbmcgdG8gYSBuZXcNCj4gPiBhbGxvY2F0ZWQgYnVmZmVyIG9iamVjdCBkdXJpbmcgS0ZEIHBy
b2Nlc3MgY3JlYXRpb24uICBTaW5jZSB0aGUgTUVTDQo+ID4gaXMgdW5hd2FyZSBvZiB0aGlzLCBh
Y2Nlc3Mgb2YgdGhlIHBhc3NlZCBhZGRyZXNzIHBvaW50cyB0byB0aGUgc3RhbGUNCj4gPiBvYmpl
Y3Qgd2l0aGluIE1FUyBhbmQgdHJpZ2dlcnMgYSBmYXRhbCBtZW1vcnkgdmlvbGF0aW9uLg0KPiA+
DQo+ID4gVGhlIHNvbHV0aW9uIGlzIGZvciBLRkQgdG8gZXhwbGljaXRseSBmbHVzaCB0aGUgcHJv
Y2VzcyBjb250ZXh0DQo+ID4gYWRkcmVzcyBmcm9tIE1FUyBvbiBwcm9jZXNzIHRlcm1pbmF0aW9u
Lg0KPiA+DQo+ID4gTm90ZSB0aGF0IHRoZSBmbHVzaCBjYWxsIGFuZCB0aGUgTUVTIGRlYnVnZ2Vy
IGNhbGxzIHVzZSB0aGUgc2FtZSBNRVMNCj4gPiBpbnRlcmZhY2UgYnV0IGFyZSBzZXBhcmF0ZWQg
YXMgS0ZEIGNhbGxzIHRvIGF2b2lkIGNvbmZsaWN0aW5nIHdpdGgNCj4gPiBlYWNoIG90aGVyLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxqb25hdGhhbi5raW1AYW1kLmNv
bT4NCj4gPiBUZXN0ZWQtYnk6IEFsaWNlIFdvbmcgPHNoaXdlaS53b25nQGFtZC5jb20+DQo+IFJl
dmlld2VkLWJ5OiBFcmljIEh1YW5nIDxqaW5odWllcmljLmh1YW5nQGFtZC5jb20+DQo+ID4gLS0t
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMgICAgICAgfCAz
MQ0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbWVzLmggICAgICAgfCAxMCArKystLS0NCj4gPiAgIC4uLi9hbWQvYW1ka2ZkL2tm
ZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyAgICB8ICAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvaW5jbHVkZS9tZXNfdjExX2FwaV9kZWYuaCB8ICAzICstDQo+ID4gICA0IGZpbGVzIGNo
YW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5jDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMNCj4gPiBpbmRleCBlNTQ0YjgyM2Fi
ZjYuLmU5OGRlMjMyNTBkYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfbWVzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfbWVzLmMNCj4gPiBAQCAtOTE2LDYgKzkxNiwxMSBAQCBpbnQgYW1kZ3B1X21lc19zZXRf
c2hhZGVyX2RlYnVnZ2VyKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiA+ICAgICAg
IG9wX2lucHV0Lm9wID0gTUVTX01JU0NfT1BfU0VUX1NIQURFUl9ERUJVR0dFUjsNCj4gPiAgICAg
ICBvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLnByb2Nlc3NfY29udGV4dF9hZGRyID0NCj4g
cHJvY2Vzc19jb250ZXh0X2FkZHI7DQo+ID4gICAgICAgb3BfaW5wdXQuc2V0X3NoYWRlcl9kZWJ1
Z2dlci5mbGFncy51MzJhbGwgPSBmbGFnczsNCj4gPiArDQo+ID4gKyAgICAgLyogdXNlIGFtZGdw
dSBtZXNfZmx1c2hfc2hhZGVyX2RlYnVnZ2VyIGluc3RlYWQgKi8NCj4gPiArICAgICBpZiAob3Bf
aW5wdXQuc2V0X3NoYWRlcl9kZWJ1Z2dlci5mbGFncy5wcm9jZXNzX2N0eF9mbHVzaCkNCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiAgICAgICBvcF9pbnB1dC5z
ZXRfc2hhZGVyX2RlYnVnZ2VyLnNwaV9nZGJnX3Blcl92bWlkX2NudGwgPQ0KPiBzcGlfZ2RiZ19w
ZXJfdm1pZF9jbnRsOw0KPiA+ICAgICAgIG1lbWNweShvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVn
Z2VyLnRjcF93YXRjaF9jbnRsLA0KPiB0Y3Bfd2F0Y2hfY250bCwNCj4gPg0KPiA+IHNpemVvZihv
cF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLnRjcF93YXRjaF9jbnRsKSk7DQo+ID4gQEAgLTkz
NSw2ICs5NDAsMzIgQEAgaW50IGFtZGdwdV9tZXNfc2V0X3NoYWRlcl9kZWJ1Z2dlcihzdHJ1Y3QN
Cj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiAgICAgICByZXR1cm4gcjsNCj4gPiAgIH0NCj4g
Pg0KPiA+ICtpbnQgYW1kZ3B1X21lc19mbHVzaF9zaGFkZXJfZGVidWdnZXIoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50NjRfdCBwcm9jZXNzX2NvbnRleHRfYWRkcikgew0KPiA+ICsgICAgIHN0cnVjdCBtZXNfbWlz
Y19vcF9pbnB1dCBvcF9pbnB1dCA9IHswfTsNCj4gPiArICAgICBpbnQgcjsNCj4gPiArDQo+ID4g
KyAgICAgaWYgKCFhZGV2LT5tZXMuZnVuY3MtPm1pc2Nfb3ApIHsNCj4gPiArICAgICAgICAgICAg
IERSTV9FUlJPUigibWVzIGZsdXNoIHNoYWRlciBkZWJ1Z2dlciBpcyBub3Qgc3VwcG9ydGVkIVxu
Iik7DQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgICB9DQo+ID4g
Kw0KPiA+ICsgICAgIG9wX2lucHV0Lm9wID0gTUVTX01JU0NfT1BfU0VUX1NIQURFUl9ERUJVR0dF
UjsNCj4gPiArICAgICBvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLnByb2Nlc3NfY29udGV4
dF9hZGRyID0NCj4gcHJvY2Vzc19jb250ZXh0X2FkZHI7DQo+ID4gKyAgICAgb3BfaW5wdXQuc2V0
X3NoYWRlcl9kZWJ1Z2dlci5mbGFncy5wcm9jZXNzX2N0eF9mbHVzaCA9IHRydWU7DQo+ID4gKw0K
PiA+ICsgICAgIGFtZGdwdV9tZXNfbG9jaygmYWRldi0+bWVzKTsNCj4gPiArDQo+ID4gKyAgICAg
ciA9IGFkZXYtPm1lcy5mdW5jcy0+bWlzY19vcCgmYWRldi0+bWVzLCAmb3BfaW5wdXQpOw0KPiA+
ICsgICAgIGlmIChyKQ0KPiA+ICsgICAgICAgICAgICAgRFJNX0VSUk9SKCJmYWlsZWQgdG8gc2V0
X3NoYWRlcl9kZWJ1Z2dlclxuIik7DQo+ID4gKw0KPiA+ICsgICAgIGFtZGdwdV9tZXNfdW5sb2Nr
KCZhZGV2LT5tZXMpOw0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gcjsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgIHN0YXRpYyB2b2lkDQo+ID4gICBhbWRncHVfbWVzX3JpbmdfdG9fcXVldWVfcHJvcHMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+ID4gaW5kZXggODk0YjliMTMzMDAwLi43ZDRmOTNmZWE5
MzcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21l
cy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+
ID4gQEAgLTI5Niw5ICsyOTYsMTAgQEAgc3RydWN0IG1lc19taXNjX29wX2lucHV0IHsNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgcHJvY2Vzc19jb250ZXh0X2FkZHI7DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIHVuaW9uIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3Qgew0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDY0X3Qgc2luZ2xlX21lbW9wIDogMTsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpbmdsZV9hbHVfb3AgOiAxOw0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgcmVzZXJ2ZWQ6IDMwOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc2luZ2xlX21l
bW9wIDogMTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IHNpbmdsZV9hbHVfb3AgOiAxOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDMyX3QgcmVzZXJ2ZWQ6IDI5Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgcHJvY2Vzc19jdHhfZmx1c2g6IDE7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCB1MzJhbGw7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIH0gZmxh
Z3M7DQo+ID4gQEAgLTM3NCw3ICszNzUsOCBAQCBpbnQgYW1kZ3B1X21lc19zZXRfc2hhZGVyX2Rl
YnVnZ2VyKHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQzMl90ICp0Y3Bfd2F0Y2hfY250bCwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBmbGFncywNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBib29sIHRyYXBfZW4pOw0KPiA+IC0NCj4gPiAraW50IGFtZGdw
dV9tZXNfZmx1c2hfc2hhZGVyX2RlYnVnZ2VyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHByb2Nlc3NfY29udGV4
dF9hZGRyKTsNCj4gPiAgIGludCBhbWRncHVfbWVzX2FkZF9yaW5nKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBpbnQgZ2FuZ19pZCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgaW50IHF1
ZXVlX3R5cGUsIGludCBpZHgsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRn
cHVfbWVzX2N0eF9kYXRhICpjdHhfZGF0YSwgZGlmZg0KPiA+IC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gPiBpbmRl
eCA3N2Y0OTMyNjJlMDUuLjhlNTVlNzhmY2U0ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4g
PiBAQCAtODcsNiArODcsNyBAQCB2b2lkIGtmZF9wcm9jZXNzX2RlcXVldWVfZnJvbV9kZXZpY2Uo
c3RydWN0DQo+IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkKQ0KPiA+ICAgICAgICAgICAgICAgcmV0
dXJuOw0KPiA+DQo+ID4gICAgICAgZGV2LT5kcW0tPm9wcy5wcm9jZXNzX3Rlcm1pbmF0aW9uKGRl
di0+ZHFtLCAmcGRkLT5xcGQpOw0KPiA+ICsgICAgIGFtZGdwdV9tZXNfZmx1c2hfc2hhZGVyX2Rl
YnVnZ2VyKGRldi0+YWRldiwgcGRkLQ0KPiA+cHJvY19jdHhfZ3B1X2FkZHIpOw0KPiA+ICAgICAg
IHBkZC0+YWxyZWFkeV9kZXF1ZXVlZCA9IHRydWU7DQo+ID4gICB9DQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL21lc192MTFfYXBpX2RlZi5oDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiBpbmRl
eCAxZmJmZDFhYTk4N2UuLmVjNWI5YWI2N2M1ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiBAQCAtNTcyLDcgKzU3Miw4
IEBAIHN0cnVjdCBTRVRfU0hBREVSX0RFQlVHR0VSIHsNCj4gPiAgICAgICAgICAgICAgIHN0cnVj
dCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpbmdsZV9tZW1vcCA6IDE7
ICAvKiBTUV9ERUJVRy5zaW5nbGVfbWVtb3AgKi8NCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3Qgc2luZ2xlX2FsdV9vcCA6IDE7IC8qIFNRX0RFQlVHLnNpbmdsZV9hbHVfb3AgKi8N
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgcmVzZXJ2ZWQgOiAzMDsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgcmVzZXJ2ZWQgOiAyOTsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgcHJvY2Vzc19jdHhfZmx1c2ggOiAxOw0KPiA+ICAgICAg
ICAgICAgICAgfTsNCj4gPiAgICAgICAgICAgICAgIHVpbnQzMl90IHUzMmFsbDsNCj4gPiAgICAg
ICB9IGZsYWdzOw0KPg0KDQoNCg==
