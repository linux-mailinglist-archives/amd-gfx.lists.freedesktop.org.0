Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C852389B749
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Apr 2024 07:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBCD1120CF;
	Mon,  8 Apr 2024 05:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z6rQKbD/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2110.outbound.protection.outlook.com [40.107.236.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FBD1120CF
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Apr 2024 05:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjQJ68fgzP7mMr87PlMLJ3RVQJCVwQNJ4uASNTUO92dplJC4bXYNcLqeOT/38C3fGhEpsEKrz/kWHeh45+gj/e2m9EfSGrnoyta7NDUibDaBFLRJU+4bwDvGlnTwJJssx7B1GKejApvO1XwLZ2TLgvT/icULuoJqpcBMfbaV4qMDgxs3ajO3/MXiz7yWBaU5ZMiGZs6v+2Z5RVwu/xNSZVMjwEeZ7jzoPu2Pj/ST4ilRZTHZ79DRhD0dOXIdO4zOtAj8VMLoxnBG6DxLuXDFxPiOAzbLbZlnb3ddE2tQnximwTA0ecrFiZA8ZXwHKS9K9TiC6XDW7uNE4UNIC9spbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJVJZAvpNYy2TP776W2RW92nfuAPZa1LwktSpNYLBP8=;
 b=Q0h7l60MaQfIFENFDF7M3heeyyJWsAGUDlMgLfHMuI6I0wPnXnOxOuAPURGLR9XSf4iPU2iw0dGRVn59Lo0WpDNCM5TYOyTSZo0f3XGiA8nsU2npQCsonayoGMQGyik1xM0WRwCrKNOd6luejJcv2881vKxjABVMbYazkoMyBfaj+tOcv+zNqfuZLy4HuD9RvKkiATxvnow36IFEHbf2lR9QIx5HU2N4w6G5pdx5zzB1fVMdoEwMV34ofhkUfxmG/qlvkAFID+YxafxHbsaF+bn5A/eEzx2DrpvLz1+G4Ycu74gJfkmIuBDzR2FEtwyWiQBHGTnYO/c5L5B/XHd+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJVJZAvpNYy2TP776W2RW92nfuAPZa1LwktSpNYLBP8=;
 b=z6rQKbD/ZvhkyCOFVCxoRE9JoHoslOxlyxYJjrXSV4HxVkGyrbwV36YYFldXlJ31VT1g6AuxF9lOtvIv1xb4KonjYMMorkzgzNbil29bEnvYEV0sqdsBxtA8RHcAYq35AFEEOCk4pJlJbdTMJs61lK3WF1XyppR17qogo3gd2s4=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 DS0PR12MB7927.namprd12.prod.outlook.com (2603:10b6:8:147::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Mon, 8 Apr 2024 05:55:23 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::a702:68e0:aa54:fb87]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::a702:68e0:aa54:fb87%4]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 05:55:23 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Fix the ring buffer size for queue VM flush
Thread-Topic: [PATCH] drm/amdgpu: Fix the ring buffer size for queue VM flush
Thread-Index: AQHaf1as8VSPGUI6CEeBpzEAfDSI8bFYF1wAgAXYbmA=
Date: Mon, 8 Apr 2024 05:55:23 +0000
Message-ID: <DS7PR12MB6005EB48CE285205BDCD4DA7FB002@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <20240326082147.1694774-1-Prike.Liang@amd.com>
 <fa982b65-40b9-4a12-80da-701ffd4ae9d8@gmail.com>
In-Reply-To: <fa982b65-40b9-4a12-80da-701ffd4ae9d8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=80b1d186-e045-48bd-9ef9-5ab830563ccc;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-04-08T05:40:15Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|DS0PR12MB7927:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGhSMG/imIYYyvyI0fI/HXg3EAFMU8m0bMYtL3pj4IlfEDBTAdgcKOItDUXzprJAh8h5Zo8G0WCUaDt83aAQGOyGi9cXpqGbOhuAyC544p4q+9FBRgHodoNHNAyxqafrM1hQFn3l7TajhQeAxbD4xdIHowcxIHm5Bc2Kc2maHe+95Qq8S41OUnfSQs9RAYFWiMajMi+bcXzkx21uQe6aZy+3rnEes+ThD3DK2tU3fkfeNiQUwDtSnJWR2waHtPWGDvMC8ZSe7ar4e5F40GQyC1VBxO12U2vpYzFZ+NlOt6las9JZEH8nbPPtNcO/t+Uz6LM0wvc6SRO7uJL7SIIuT/byWtCkVSEBfyqMlOQZkmvfg16X7MbYJFLue/hf2bfxMtrE+vdsYYEbEEjlMsx17hHKglulBVEAz6TF9yolIAuUdteR4EaYxBYWiDUTVqCBa0tgGStWeWq7/0Vl8099PBPTIiFH4dpJ1lxw0XIM6AYV2zaMn6TnUFa2gUcZeszqjSZCw19V4omfvHrHSzha/5iaiXFJFGKDa8HXFKrCuy/qhsCoPeI39xyvqvqmdTUWL3GFcf/UmUuE4154QWGgA5OKKm/o/qGW9WT1by+a6+fyzjElbgt3bTH+MZ/9emlhZJyG33r0uhKHfggKy/vkPzNyssmSevLasUqklytn+Fw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0dnd3JZcGVyOXJ6Y211VmtRbEN5V0Y2SU02NGhrRTZQOXA5SERYRWlSOS9K?=
 =?utf-8?B?UWJwamtydGVlQ2lFdUJGbWt5bEp1M3E4NVd1QTVwbHAvR0NMSUNHUlVSNkxk?=
 =?utf-8?B?MFI4OHpNUHo1eDV2M1ZwRnpSenl5Z09Gak1ZQzdsZENPdGpMM01uMTVvTkZj?=
 =?utf-8?B?OEl1M0VaTVgwbkRVbzlNN2E2cGU2cHZzR0JMeURsZWtjOEQyN3dXN2xxNWtS?=
 =?utf-8?B?ejIyQnJVSU02OGFZcE5YWEZUL2VVT0ZRR2tORjdBcXBlQkE5M0pybTZwMkg5?=
 =?utf-8?B?cHF3R2NyWjQ0TVpkbEtGMVN1TGNCZW5scitzLzlkd1dIWUUrd2NrVGcyaDQr?=
 =?utf-8?B?Z0s0UzZPYlBWLzErdVdjQldKWUk1RWhURVpPNlBwOENoT1BwUFhacWVBR2hz?=
 =?utf-8?B?azAyeHpDRk1LVWUvM3pPVVBXMytiMzltTXdRZy83NHdtNjNmY0dLNEtNRWti?=
 =?utf-8?B?djVmWjl3SHFINFBtRzFHeFlQdEszT1ZZcEhWVWZZMDFETnhwdFh5M1E3NVIr?=
 =?utf-8?B?WVVxUFVvcHhwb2RqV1RFZkdXZll5NGZSb0oyM2ltMGtPNFpPT3A3U0lDUXJR?=
 =?utf-8?B?dzZack55MkF4QlpGT1lBLzV5WE50RUVmMUxPQkVYZmFRN2VocTMyalltUmdp?=
 =?utf-8?B?ZGlOTTFZbWFPUE9IYktERUJSMnVnemJqU3hzNXVCSlY2bmVzaVpGY3pDZGZw?=
 =?utf-8?B?a3RTRHlzWWVqT0N5eldzNUVWVURrejdYa2tqbFlxYkp1UFdDc2pnTWlOTnIx?=
 =?utf-8?B?S1hRdjZUaVMvaXZBQmJPTE0wclZaL3Mva3ZhVGZlMldRLzREcUV0TWNqMlQy?=
 =?utf-8?B?eldRUEs4RFRCbG9BQ3FFcW9KSW1FWm9XejE1dmtGVDQwRmR0NTd0QjNjZ09X?=
 =?utf-8?B?VGRWNzFTbEp4RW13N0ZQMmx4QU5QTUZONUpLOTBzN29saTFLeGpyUFlhekdY?=
 =?utf-8?B?cEIrRk1jTlpmLy9BcE5CanRUQmtxaEUrL045NXZhU1YwNjU5U3ZkcStUakQr?=
 =?utf-8?B?M3pzNzA0VFFaN3BhSDQ0MmtjZHRpa3g0UTAzOFRtelFpSGh3cmwzeVNUa0tq?=
 =?utf-8?B?S3ZCL25mdkI5N000RitPLzh5T3lSL2lObWJiQWpZUXJ6MnQyREdYUjRtR3Fx?=
 =?utf-8?B?RWR4Z0VvYzNEbUVRL1lXVUZBbHU2K1Z4ZGJlR0tzdC91c3dVZDc3MmJzOVVk?=
 =?utf-8?B?RnpZcHIyTGZIUDV5TzJkT0NoL0RkZlk0aGo1d3BqWFN5Szc1bW8rYjdMWEhJ?=
 =?utf-8?B?YXAwOHJZZThtTFJFRjJmODFOMDRncW5uV1lvb253M00wdU9oeXo4aERnaFl5?=
 =?utf-8?B?OWoyamxHR1J3QnpxTnlBd1p2VlJyNGdBNW5iOFlhdjVxQldYQ2VKZHhYaXZN?=
 =?utf-8?B?RGNLU0RSU0c1ZVNscnhJSFdML0FpS3hUSiswWDRCNXNmVEgwWnN6SWlmc2lQ?=
 =?utf-8?B?eTRiMHNCSDRkSkJyalBOSkR0ZldYVkU4OThESVU5dzdYWENNTXQ2R3hWZ0tT?=
 =?utf-8?B?NzYwWTdGMENweHhEZnZMaFdnNjdIZ2FwTFJ1MktqMjhyOGVSazVKQ09OeWdE?=
 =?utf-8?B?UkRJUFFFR3JhZUVSQmhPaUVlYnNxOEpvQm5sTFNDcHd5REFDOExGWFdkYkdz?=
 =?utf-8?B?RVdzMC9qREZ3MThlS3V1Mi82TVlFZ1p2THFEaTB5cTRCS1pNQVg1alVOL0xO?=
 =?utf-8?B?c3MyWnVaVjhqbHFxZlJtNkNoOUNwK25tRFFFanhTbk5aVWkrMFhSemV6UUNr?=
 =?utf-8?B?YnEvalU0SGdJVm40NGd3eWM5WVZnYUIxUlB1MTdRVlBNczU2WUpWYjJqMm9l?=
 =?utf-8?B?QTNka1R1ckRCTE5rR1ZBL3pXQldKaVJuOHNEYUxRSGpTM1Qza3VEVlFsajJO?=
 =?utf-8?B?S3RQc0xOVmVoQ1NEOWJibUF6Y2FKSHRmdTJWeG50YVk2RXQ0MG5wWnNCbUdB?=
 =?utf-8?B?aVh4NE9QSzNjVmpQK1JDMEdKOThYclBwR2p3MVNTbzRtcWE5Q2pJNEt3OXdz?=
 =?utf-8?B?ZHIzenZFSHB4WTZQZHNHMVNhV0svOWFmSkxwK2htN25nQ0lXYUhHb1huTWtI?=
 =?utf-8?B?TXNNTDRUcTRoaE1sQlFPeUVEUzlSdlVMUVVjOFBUUkFZakxjVDk4cm9XajNV?=
 =?utf-8?Q?PKiQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3b7f5f-62d9-4da4-50d4-08dc57907b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 05:55:23.1133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rUDkV1oviyLAhNhjHNScpQiNqoNR/0DQ4x9tXjw+T1u5ao3iCfuJ/wrkZ0qr5Eyr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoYW5rIHlvdSwgQ2hyaXN0aWFu
LCBmb3IgdGhlIHJldmlldy4gSSB3aWxsIHJlbW92ZSB0aGUgZ2Z4X3Y5XzBfcmluZ19lbWl0X3Zt
X2ZsdXNoKCkgSVAgdHlwZSBjb25kaXRpb24gY2hlY2sgYmVmb3JlIHB1c2hpbmcgdGhlIGNvbW1p
dC4NCg0KVGhhbmtzLA0KUHJpa2UNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4N
Cj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDQsIDIwMjQgODoyNCBQTQ0KPiBUbzogTGlhbmcsIFBy
aWtlIDxQcmlrZS5MaWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogRml4IHRoZSByaW5nIGJ1ZmZlciBzaXpl
IGZvciBxdWV1ZSBWTSBmbHVzaA0KPg0KPiBBbSAyNi4wMy4yNCB1bSAwOToyMSBzY2hyaWViIFBy
aWtlIExpYW5nOg0KPiA+IEhlcmUgYXJlIHRoZSBjb3JyZWN0aW9ucyBuZWVkZWQgZm9yIHRoZSBx
dWV1ZSByaW5nIGJ1ZmZlciBzaXplDQo+ID4gY2FsY3VsYXRpb24gZm9yIHRoZSBmb2xsb3dpbmcg
Y2FzZXM6DQo+ID4gLSBSZW1vdmUgdGhlIEtJUSBWTSBmbHVzaCByaW5nIHVzYWdlLg0KPiA+IC0g
QWRkIHRoZSBpbnZhbGlkYXRlIFRMQnMgcGFja2V0IGZvciBnZngxMCBhbmQgZ2Z4MTEgcXVldWUu
DQo+ID4gLSBUaGVyZSdzIG5vIFZNIGZsdXNoIGFuZCBQRlAgc3luYywgc28gcmVtb3ZlIHRoZSBn
Zng5IHJlYWwNCj4gPiAgICByaW5nIGFuZCBjb21wdXRlIHJpbmcgYnVmZmVyIHVzYWdlLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+DQo+
DQo+IEdvb2QgY2F0Y2gsIHRoYXQgd2FzIHByb2JhYmx5IGp1c3QgY29waWVkIG92ZXIgZnJvbSB0
aGUgZ2Z4IGltcGxlbWVudGF0aW9uLg0KPg0KPiBXaGVuIHRoZSBmdW5jdGlvbiBpc24ndCB1c2Vk
IHdpdGggdGhlIGNvbXB1dGUgcmluZ3MgYW55IG1vcmUgeW91IGNhbg0KPiBwcm9iYWJseSBhbHNv
IHJlbW92ZSB0aGlzIGZyb20gZ2Z4X3Y5XzBfcmluZ19lbWl0X3ZtX2ZsdXNoKCk6DQo+DQo+ICAg
ICAgICAgIC8qIGNvbXB1dGUgZG9lc24ndCBoYXZlIFBGUCAqLw0KPiAgICAgICAgICBpZiAocmlu
Zy0+ZnVuY3MtPnR5cGUgPT0gQU1ER1BVX1JJTkdfVFlQRV9HRlgpIHsNCj4NCj4gV2l0aCBvciB3
aXRob3V0IHRoYXQgdGhlIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnDQo+
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Lg0KPg0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4N
Cj4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
IHwgMyArLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTFfMC5jIHwg
MyArLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgIHwgNSAt
LS0tLQ0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQo+
ID4gaW5kZXggZDUyNGYxYTM1M2VkLi4wYzczMTJjMGZhN2YgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KPiA+IEBAIC05MTg2LDcgKzkxODYsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzDQo+IGdmeF92MTBfMF9yaW5nX2Z1
bmNzX2dmeCA9IHsNCj4gPiAgICAgICAgICAgICA3ICsgLyogUElQRUxJTkVfU1lOQyAqLw0KPiA+
ICAgICAgICAgICAgIFNPQzE1X0ZMVVNIX0dQVV9UTEJfTlVNX1dSRUcgKiA1ICsNCj4gPiAgICAg
ICAgICAgICBTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9SRUdfV0FJVCAqIDcgKw0KPiA+IC0gICAg
ICAgICAgIDIgKyAvKiBWTV9GTFVTSCAqLw0KPiA+ICsgICAgICAgICAgIDQgKyAvKiBWTV9GTFVT
SCAqLw0KPiA+ICAgICAgICAgICAgIDggKyAvKiBGRU5DRSBmb3IgVk1fRkxVU0ggKi8NCj4gPiAg
ICAgICAgICAgICAyMCArIC8qIEdEUyBzd2l0Y2ggKi8NCj4gPiAgICAgICAgICAgICA0ICsgLyog
ZG91YmxlIFNXSVRDSF9CVUZGRVIsDQo+ID4gQEAgLTkyNzYsNyArOTI3Niw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MNCj4gZ2Z4X3YxMF8wX3JpbmdfZnVuY3Nfa2lx
ID0gew0KPiA+ICAgICAgICAgICAgIDcgKyAvKiBnZnhfdjEwXzBfcmluZ19lbWl0X3BpcGVsaW5l
X3N5bmMgKi8NCj4gPiAgICAgICAgICAgICBTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9XUkVHICog
NSArDQo+ID4gICAgICAgICAgICAgU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA3
ICsNCj4gPiAtICAgICAgICAgICAyICsgLyogZ2Z4X3YxMF8wX3JpbmdfZW1pdF92bV9mbHVzaCAq
Lw0KPiA+ICAgICAgICAgICAgIDggKyA4ICsgOCwgLyogZ2Z4X3YxMF8wX3JpbmdfZW1pdF9mZW5j
ZV9raXEgeDMgZm9yIHVzZXIgZmVuY2UsDQo+IHZtIGZlbmNlICovDQo+ID4gICAgIC5lbWl0X2li
X3NpemUgPSA3LCAvKiBnZnhfdjEwXzBfcmluZ19lbWl0X2liX2NvbXB1dGUgKi8NCj4gPiAgICAg
LmVtaXRfaWIgPSBnZnhfdjEwXzBfcmluZ19lbWl0X2liX2NvbXB1dGUsIGRpZmYgLS1naXQNCj4g
PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTFfMC5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYw0KPiA+IGluZGV4IDdhOTA2MzE4ZTQ1MS4u
NTM5MGRkMmM1MWRhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92MTFfMC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Yx
MV8wLmMNCj4gPiBAQCAtNjE5MSw3ICs2MTkxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRn
cHVfcmluZ19mdW5jcw0KPiBnZnhfdjExXzBfcmluZ19mdW5jc19nZnggPSB7DQo+ID4gICAgICAg
ICAgICAgNyArIC8qIFBJUEVMSU5FX1NZTkMgKi8NCj4gPiAgICAgICAgICAgICBTT0MxNV9GTFVT
SF9HUFVfVExCX05VTV9XUkVHICogNSArDQo+ID4gICAgICAgICAgICAgU09DMTVfRkxVU0hfR1BV
X1RMQl9OVU1fUkVHX1dBSVQgKiA3ICsNCj4gPiAtICAgICAgICAgICAyICsgLyogVk1fRkxVU0gg
Ki8NCj4gPiArICAgICAgICAgICA0ICsgLyogVk1fRkxVU0ggKi8NCj4gPiAgICAgICAgICAgICA4
ICsgLyogRkVOQ0UgZm9yIFZNX0ZMVVNIICovDQo+ID4gICAgICAgICAgICAgMjAgKyAvKiBHRFMg
c3dpdGNoICovDQo+ID4gICAgICAgICAgICAgNSArIC8qIENPTkRfRVhFQyAqLw0KPiA+IEBAIC02
Mjc3LDcgKzYyNzcsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzDQo+
IGdmeF92MTFfMF9yaW5nX2Z1bmNzX2tpcSA9IHsNCj4gPiAgICAgICAgICAgICA3ICsgLyogZ2Z4
X3YxMV8wX3JpbmdfZW1pdF9waXBlbGluZV9zeW5jICovDQo+ID4gICAgICAgICAgICAgU09DMTVf
RkxVU0hfR1BVX1RMQl9OVU1fV1JFRyAqIDUgKw0KPiA+ICAgICAgICAgICAgIFNPQzE1X0ZMVVNI
X0dQVV9UTEJfTlVNX1JFR19XQUlUICogNyArDQo+ID4gLSAgICAgICAgICAgMiArIC8qIGdmeF92
MTFfMF9yaW5nX2VtaXRfdm1fZmx1c2ggKi8NCj4gPiAgICAgICAgICAgICA4ICsgOCArIDgsIC8q
IGdmeF92MTFfMF9yaW5nX2VtaXRfZmVuY2Vfa2lxIHgzIGZvciB1c2VyIGZlbmNlLA0KPiB2bSBm
ZW5jZSAqLw0KPiA+ICAgICAuZW1pdF9pYl9zaXplID0gNywgLyogZ2Z4X3YxMV8wX3JpbmdfZW1p
dF9pYl9jb21wdXRlICovDQo+ID4gICAgIC5lbWl0X2liID0gZ2Z4X3YxMV8wX3JpbmdfZW1pdF9p
Yl9jb21wdXRlLCBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+
ID4gaW5kZXggNzFiNTU1OTkzYjdhLi5mY2UwYjgyMzhkMTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gPiBAQCAtNjg3Miw3ICs2ODcyLDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcw0KPiBnZnhfdjlfMF9yaW5nX2Z1bmNz
X2dmeCA9IHsNCj4gPiAgICAgICAgICAgICA3ICsgIC8qIFBJUEVMSU5FX1NZTkMgKi8NCj4gPiAg
ICAgICAgICAgICBTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9XUkVHICogNSArDQo+ID4gICAgICAg
ICAgICAgU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA3ICsNCj4gPiAtICAgICAg
ICAgICAyICsgLyogVk1fRkxVU0ggKi8NCj4gPiAgICAgICAgICAgICA4ICsgIC8qIEZFTkNFIGZv
ciBWTV9GTFVTSCAqLw0KPiA+ICAgICAgICAgICAgIDIwICsgLyogR0RTIHN3aXRjaCAqLw0KPiA+
ICAgICAgICAgICAgIDQgKyAvKiBkb3VibGUgU1dJVENIX0JVRkZFUiwNCj4gPiBAQCAtNjg5Miw3
ICs2ODkxLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcw0KPiBnZnhf
djlfMF9yaW5nX2Z1bmNzX2dmeCA9IHsNCj4gPiAgICAgLmVtaXRfaWIgPSBnZnhfdjlfMF9yaW5n
X2VtaXRfaWJfZ2Z4LA0KPiA+ICAgICAuZW1pdF9mZW5jZSA9IGdmeF92OV8wX3JpbmdfZW1pdF9m
ZW5jZSwNCj4gPiAgICAgLmVtaXRfcGlwZWxpbmVfc3luYyA9IGdmeF92OV8wX3JpbmdfZW1pdF9w
aXBlbGluZV9zeW5jLA0KPiA+IC0gICAuZW1pdF92bV9mbHVzaCA9IGdmeF92OV8wX3JpbmdfZW1p
dF92bV9mbHVzaCwNCj4gPiAgICAgLmVtaXRfZ2RzX3N3aXRjaCA9IGdmeF92OV8wX3JpbmdfZW1p
dF9nZHNfc3dpdGNoLA0KPiA+ICAgICAuZW1pdF9oZHBfZmx1c2ggPSBnZnhfdjlfMF9yaW5nX2Vt
aXRfaGRwX2ZsdXNoLA0KPiA+ICAgICAudGVzdF9yaW5nID0gZ2Z4X3Y5XzBfcmluZ190ZXN0X3Jp
bmcsIEBAIC02OTgxLDcgKzY5NzksNiBAQCBzdGF0aWMNCj4gPiBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X3JpbmdfZnVuY3MgZ2Z4X3Y5XzBfcmluZ19mdW5jc19jb21wdXRlID0gew0KPiA+ICAgICAgICAg
ICAgIDcgKyAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfcGlwZWxpbmVfc3luYyAqLw0KPiA+ICAgICAg
ICAgICAgIFNPQzE1X0ZMVVNIX0dQVV9UTEJfTlVNX1dSRUcgKiA1ICsNCj4gPiAgICAgICAgICAg
ICBTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9SRUdfV0FJVCAqIDcgKw0KPiA+IC0gICAgICAgICAg
IDIgKyAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfdm1fZmx1c2ggKi8NCj4gPiAgICAgICAgICAgICA4
ICsgOCArIDggKyAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfZmVuY2UgeDMgZm9yIHVzZXIgZmVuY2Us
IHZtDQo+IGZlbmNlICovDQo+ID4gICAgICAgICAgICAgNyArIC8qIGdmeF92OV8wX2VtaXRfbWVt
X3N5bmMgKi8NCj4gPiAgICAgICAgICAgICA1ICsgLyogZ2Z4X3Y5XzBfZW1pdF93YXZlX2xpbWl0
IGZvciB1cGRhdGluZw0KPiA+IG1tU1BJX1dDTF9QSVBFX1BFUkNFTlRfR0ZYIHJlZ2lzdGVyICov
IEBAIC02OTkwLDcgKzY5ODcsNiBAQCBzdGF0aWMNCj4gY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5n
X2Z1bmNzIGdmeF92OV8wX3JpbmdfZnVuY3NfY29tcHV0ZSA9IHsNCj4gPiAgICAgLmVtaXRfaWIg
PSBnZnhfdjlfMF9yaW5nX2VtaXRfaWJfY29tcHV0ZSwNCj4gPiAgICAgLmVtaXRfZmVuY2UgPSBn
ZnhfdjlfMF9yaW5nX2VtaXRfZmVuY2UsDQo+ID4gICAgIC5lbWl0X3BpcGVsaW5lX3N5bmMgPSBn
ZnhfdjlfMF9yaW5nX2VtaXRfcGlwZWxpbmVfc3luYywNCj4gPiAtICAgLmVtaXRfdm1fZmx1c2gg
PSBnZnhfdjlfMF9yaW5nX2VtaXRfdm1fZmx1c2gsDQo+ID4gICAgIC5lbWl0X2dkc19zd2l0Y2gg
PSBnZnhfdjlfMF9yaW5nX2VtaXRfZ2RzX3N3aXRjaCwNCj4gPiAgICAgLmVtaXRfaGRwX2ZsdXNo
ID0gZ2Z4X3Y5XzBfcmluZ19lbWl0X2hkcF9mbHVzaCwNCj4gPiAgICAgLnRlc3RfcmluZyA9IGdm
eF92OV8wX3JpbmdfdGVzdF9yaW5nLCBAQCAtNzAxOSw3ICs3MDE1LDYgQEAgc3RhdGljDQo+ID4g
Y29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIGdmeF92OV8wX3JpbmdfZnVuY3Nfa2lxID0g
ew0KPiA+ICAgICAgICAgICAgIDcgKyAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfcGlwZWxpbmVfc3lu
YyAqLw0KPiA+ICAgICAgICAgICAgIFNPQzE1X0ZMVVNIX0dQVV9UTEJfTlVNX1dSRUcgKiA1ICsN
Cj4gPiAgICAgICAgICAgICBTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9SRUdfV0FJVCAqIDcgKw0K
PiA+IC0gICAgICAgICAgIDIgKyAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfdm1fZmx1c2ggKi8NCj4g
PiAgICAgICAgICAgICA4ICsgOCArIDgsIC8qIGdmeF92OV8wX3JpbmdfZW1pdF9mZW5jZV9raXEg
eDMgZm9yIHVzZXIgZmVuY2UsDQo+IHZtIGZlbmNlICovDQo+ID4gICAgIC5lbWl0X2liX3NpemUg
PSA3LCAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfaWJfY29tcHV0ZSAqLw0KPiA+ICAgICAuZW1pdF9m
ZW5jZSA9IGdmeF92OV8wX3JpbmdfZW1pdF9mZW5jZV9raXEsDQoNCg==
