Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF8871268
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Mar 2024 02:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248B61127F0;
	Tue,  5 Mar 2024 01:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3gzpL6Uy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE961127F1
 for <amd-gfx@lists.freedesktop.org>; Tue,  5 Mar 2024 01:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvbrDCJeoDZBYpADyaqfq9nyGIN/0/sHsWV4SCfq1DNACUqyw125U2YM9lv4xZxIUa5OQhHP9+1kXxnvLW8WOC8OSlavJHw8dHGtpPqoUcpK3XDKMk8r9pLlm20M1dJ0M9rVB+4a7r001Cds+U3C+spZ+DpHgL63jz065bCAhJaDqFx5LjmY5fHeXsETAUspqcoqtQdpFr/cHoaHmvTCqfhkSPENYZ+aytRGkTQ1mtoQiXtnubkPirk1Bub4sIYEnVJLuAk/KWAB3fGRjAofZZIdEa5SdSc5Lr3xvGImyEdvrCP/eBdanPgNkGgWTiXJfW3E/I6LHpFY+d2MunD5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7QlkQ/sdqRQZkGqbxxt/t6jBjHkO8WbS2tb5gaPvZc=;
 b=DBTcUqJ8iSt4JFl8c9QHGFSwohuBje2a0gdgUmXGLlmr9xU+wvkefxLhBSZCWJZe/JS2LjZf/N+S7JKo4SM61xHPBv8IfT0lUx17bcMchZU98N1AjT6snLEd4kuKG+EoWxDSbncFodb2NwmwE7EgTfnTFAX9S66HRXioN5gLlBFfeYadDQzSPP5Kp76KXEcHZWGImOheIil1p/Xn/u6JNaEARwA4FK6JvvPrWh6MGjq0bmidxMmf296qscfaIOkkMbVxBINiMRyJjsECPnfd76WPbYpn1/4MwJ4drqg2Gc1o7o74BNKYzVZihiWuaK1MEoRnGbd8AhXjfa0nRWjODw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7QlkQ/sdqRQZkGqbxxt/t6jBjHkO8WbS2tb5gaPvZc=;
 b=3gzpL6UyHiswe72eMWhUf8J4gI5SfalLkqSIeYwi8tXIhf42nC3orlnE2tmSh6n5cT1Lg79kaSgTqCd1UhI7CKmnGA/WuMEPdHrXrqS1UtyawzP0TbOclnw7FFIPeew2r/IY5SqHG5pdVmIA0xis1gZ0AVAdW9DYwzXWEYoh8Do=
Received: from DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) by
 LV2PR12MB5895.namprd12.prod.outlook.com (2603:10b6:408:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 01:40:23 +0000
Received: from DS7PR12MB6333.namprd12.prod.outlook.com
 ([fe80::aaa7:40ef:adfd:9c26]) by DS7PR12MB6333.namprd12.prod.outlook.com
 ([fe80::aaa7:40ef:adfd:9c26%5]) with mapi id 15.20.7316.012; Tue, 5 Mar 2024
 01:40:23 +0000
From: "Zhu, Jiadong" <Jiadong.Zhu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable ring_muxer if mcbp is off
Thread-Topic: [PATCH] drm/amdgpu: disable ring_muxer if mcbp is off
Thread-Index: AQHaZjyX9TCxqPJfUkiOs0mG9GbhlLEYHtGAgASvGgCAC6GAoA==
Date: Tue, 5 Mar 2024 01:40:23 +0000
Message-ID: <DS7PR12MB6333E6A27E9E325EE21A439CF4222@DS7PR12MB6333.namprd12.prod.outlook.com>
References: <20240223094132.880396-1-pierre-eric.pelloux-prayer@amd.com>
 <CADnq5_MLkUTnLE=eFFSEV5gEq0gd3GobB5Pwsf5dJfG0MPOEgw@mail.gmail.com>
 <9577db1c-ec96-4508-aa74-f9284761f361@amd.com>
In-Reply-To: <9577db1c-ec96-4508-aa74-f9284761f361@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=09f6ad61-807a-4c6c-95f4-fc0c0bc92bc5;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-05T01:39:21Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6333:EE_|LV2PR12MB5895:EE_
x-ms-office365-filtering-correlation-id: d4bb6cbc-efc1-4b7b-26a4-08dc3cb5398c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fNxu5SgNeT7O1tOF8ogKxMCc5WM363Oh4s+WP28Z6JAMvBS4dP5cppJwEN7Rw5PuW3tdBtJ3nDGWhulqqNxhWjoG5tizs4zR7mPZptNCzv25xJOMiz0Lg3bQJTWU6rgCUi9XLbnpQF5jS0uDnG9AFZ71wVNreRRfT4zBBqVb91n15O3hVoAxud/wToHxGHt6JiGl2acXM6psPYz/uw43qtoqzHdkH7eTESLID8qYhK1tjP4Yk9aWjOegemCQ74ZvoakssEqYzxHaQrE+FH2McQA8cPrMsJB8P4XMYkZAkC8XhbVmP/OVck9ALBlck/pNcyMcw1NUK0GhmMLHFCFCzlt+qajyw9yF+c+b0gyXK9053W/0w+vhKnpexMdsE13R0nUmeK5rxZAsyg7wLZvlKcrw7Pb++4jGGnL+f8qageSIA4WUqtpophLdw1X/wHu+E8za+5EcZbWRBhJ/OtsqYC95nJj2c2Ql6CtAhzkMNxw1yEZaNINUBtrRsL8WjXS2c/feKOlAsYPzRzYYWaFMXRPupDVQo0dqfpFnH6nfIH2oRFRWOmtcVUoxssjzLGfAfOBUJnBx7EnuizZ3WfbMBkKX26624hq9FFMIutks3K4YMY2RDyENI7KoEzEMfCsfgspWQ/vnohQ/XF8ZAQErBiBZW5gkvRg6dd301sf8Pc8fKhged1b6maWEVkxoDFruONVfAd3dcXoh0s/XBbFIqJ4/Pef+Fgmr8GYcQrr9r2M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6333.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUd1ZEp2azdpUEQzOFk1T0xXaDl4bkpRdzc4SHg2WG5VdTRsM3RvQlFqY2hk?=
 =?utf-8?B?b0pIWnJnYW5WTUt5ekFDKzBSTDNnWEZvSXY0M1l2SHEvVmhNYjY3MXZmQktG?=
 =?utf-8?B?ak1nL0t2Sy82M1F2VjlTcXBnMlhVUUs0U3BsWEM3b0hkS01hVkowYitkN1Rs?=
 =?utf-8?B?UG9lMisrb0xuS3k5dndRQ2l0NGlKU0prQnMxNnk2c3htd0V6N0RtWHhITllI?=
 =?utf-8?B?MWlLT3BiT0x1VUc3bC9URGVOcW5LdTQ5MzdNS3JBcjI3cEtEMHBuYUF0blh4?=
 =?utf-8?B?RHQvRGlzVFp0Y3JINVFxT1dSL3MrYkg1M3E0YWJCMHRacEwyQUN1NFdmd1do?=
 =?utf-8?B?YTNWZEhNRGdxejIxek55b0xCa0pLWEhtTS8zOXZNU01jeWg3YXBaY29CU1Fu?=
 =?utf-8?B?Y3prWEZaWk5mbXhQaW91YlZBTWkyem9hd1kzS2tPbWMwbkpWMlptenJqM2Jt?=
 =?utf-8?B?YkRlYXJDK3RPWjNhQzEvamZKVEgrN2pieXFFbzM5OGoxS2UvdGFRbG15Qmk4?=
 =?utf-8?B?Rk11b3NNWEQ1b1hNMFBvQ0lFcVBMOXFlZ0Rra0gzSVlRcE5rTExLaGV6YjlZ?=
 =?utf-8?B?Ymcxdk1SMkQ3dlBUQkZmYS9ZcDlOTThYWkVUOGtUSzZ0U3VXQm1qcXpPTytE?=
 =?utf-8?B?aW1obGRWeDNJbGtuTDJLcEMzR09STXo2MnRYVVg5R0hla2cxMU5rZWdicUJL?=
 =?utf-8?B?clIyU3hGaXJPVU84VlBGNHBaV2hSaXRWSDVlWHpWbEk1bm1ZQTV6aUVlYVFL?=
 =?utf-8?B?VE85NHJqTXBzWW8za2NvS2VGQ21jYzBSQWt3Qm9ydklYbDlKcFFXZ3Era0VK?=
 =?utf-8?B?KzNBTkRoT1dCdkdobDIxOHAzbXlJeHAzQ3NPWXVEakgzMEVqVUxKbWRVdjFZ?=
 =?utf-8?B?NFJCRFkrc2RrSWZJdWFBQk5rVXhrZHZmMmllVm1vc2pENE1CRDhwS0FaYVoz?=
 =?utf-8?B?dWdoSDhNTGJkWnRrVTNuUVo1T2lVekNiRDJVNEtYRDNTY2s0UmdyUVJRbGVB?=
 =?utf-8?B?ZjhCVDVneWd0bFFuYVZWR0h1YkdSVmlhandJMXJxNW1sRDZic1dFUURzOGsx?=
 =?utf-8?B?eGVGSnZzMVd3TEtwTEpHbVVsS204MlBDOEJXTU12cW1FRXVCMjVrazhyVU5m?=
 =?utf-8?B?aXVsZXpYN2E2N1ovUE10cEU3MlpLRDZWTEswNkF3SW5sWWZTZEVzTHByd2l5?=
 =?utf-8?B?L1ordGgwTDlJaXVSUFlvSHRubXRwYWY2U0dvdFhmK1oyd1FYRzFMaXF1M2tY?=
 =?utf-8?B?b2JrLzNMNjdkem5pSDNGYnNXV094OU92MC9EYVB0SGZISHU0SklPdWZFU1dL?=
 =?utf-8?B?dEZHbHRlZlk4YldZRVhPcmZoRG9ZdlVVbEZRTy9ETFVqNHA1YzJMMER2bFll?=
 =?utf-8?B?cDN5anJ5cnNJWXpkanpOemtJSGxJNGNpTW9BOGpENklZOHJMV05hNk5IbWpP?=
 =?utf-8?B?bmdNdXlqLzd2REp3VWlpUS9IcmZ3eExJdnd0ZEFXUWI1RjhJNERNVHh0OThy?=
 =?utf-8?B?VWh3Y2xxdnpJaXNzQytFcHJGUVBuc2JrNUo0NFVRcWxXd0pFc2lEL0ZUN2ht?=
 =?utf-8?B?M2t3RjhQY0hkWjd3YWhmcWp4UXlKbEFMdEVCZU80RHZuOCt3MlBMRTVvWFhM?=
 =?utf-8?B?T1UyWmNsTUJhLzYvZU1EN1E0NEE0b0lLQjAvL2ppQVBBY3hYTGc1Nmc3VHI3?=
 =?utf-8?B?bmRFWVlDQnV6d3NUZUxYTGxvK01CeFJiME9ZajdqTWdSQ3gvMStQbTdlRWZI?=
 =?utf-8?B?OCtTK3krNzM0elpoQzdLcEdwMW9YYmdTZkdDK2MzbVVFT2R2cmhOSGx3UkRE?=
 =?utf-8?B?Q3FBKzBGZkJ1eXErQzZ2U1JsTFJJOTNkb0ZQY1Z6Ri9HNnJnZHZuZjdleFNY?=
 =?utf-8?B?clZBWmdHTjlzZUFKdE9EOGYvNE1HZW9kK1NwWHJRWkpCeFVvR2F4YlNneWc1?=
 =?utf-8?B?dE84ZENPWDR1Y1ZYN0djTU84Vkk1eStoM2Jya1BTYjhOWlp0VzBWKzNkNlc2?=
 =?utf-8?B?Sjg4Mm5UemRZZVZpaytrZGpYRWxsakUzZlFPeEtLS1BXRWxvYk0vQk5nMytr?=
 =?utf-8?B?bmx1a3ZOLzJxTmVzcjJMK2Qra2o2SmxnS1QrMzB5YlBGNXRlWDltamlvRHhp?=
 =?utf-8?Q?jXbM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6333.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bb6cbc-efc1-4b7b-26a4-08dc3cb5398c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 01:40:23.1588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nY1hMRp+sTEK9xFbvw3gWXrY11RDFdvoJyn0K0NmlUhMuEt37XR3Qwx87YM08bN36Fy6Arh4vDczyg250qcbHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5895
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkFja2VkLWJ5OiBKaWFkb25nIFpo
dSA8SmlhZG9uZy5aaHVAYW1kLmNvbT4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBDaHJpc3RpYW4gS8O2bmlnDQpTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNywgMjAy
NCAxMjowMiBBTQ0KVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPjsgUGVs
bG91eC1QcmF5ZXIsIFBpZXJyZS1FcmljIDxQaWVycmUtZXJpYy5QZWxsb3V4LXByYXllckBhbWQu
Y29tPg0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BB
VENIXSBkcm0vYW1kZ3B1OiBkaXNhYmxlIHJpbmdfbXV4ZXIgaWYgbWNicCBpcyBvZmYNCg0KQW0g
MjMuMDIuMjQgdW0gMTc6MzAgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9uIEZyaSwgRmViIDIz
LCAyMDI0IGF0IDQ6NDjigK9BTSBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllcg0KPiA8cGllcnJl
LWVyaWMucGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4gd3JvdGU6DQo+PiBVc2luZyB0aGUgcmluZ19t
dXhlciB3aXRob3V0IHByZWVtcHRpb24gYWRkcyBvdmVyaGVhZCBmb3Igbm8gcmVhc29uDQo+PiBz
aW5jZSBtY2JwIGNhbm5vdCBiZSB0cmlnZ2VyZWQuDQo+Pg0KPj4gTW92aW5nIGJhY2sgdG8gYSBz
aW5nbGUgcXVldWUgaW4gdGhpcyBjYXNlIGFsc28gaGVscHMgd2hlbiBoaWdoDQo+PiBwcmlvcml0
eSBhcHAgYXJlIHVzZWQ6IGluIHRoaXMgY2FzZSB0aGUgZ3B1X3NjaGVkdWxlciBwcmlvcml0eQ0K
Pj4gaGFuZGxpbmcgd2lsbCB3b3JrIGFzIGV4cGVjdGVkIC0gbXVjaCBiZXR0ZXIgdGhhbiByaW5n
X211eGVyIHdpdGggaXRzDQo+PiAyIGluZGVwZW5kYW50IHNjaGVkdWxlcnMgY29tcGV0aW5nIGZv
ciB0aGUgc2FtZSBoYXJkd2FyZSBxdWV1ZS4NCj4+DQo+PiBUaGlzIGNoYW5nZSByZXF1aXJlcyBt
b3ZpbmcgYW1kZ3B1X2RldmljZV9zZXRfbWNicCBhYm92ZQ0KPj4gYW1kZ3B1X2RldmljZV9pcF9l
YXJseV9pbml0IGJlY2F1c2Ugd2UgdXNlIGFkZXYtPmdmeC5tY2JwLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IFBpZXJyZS1FcmljIFBlbGxvdXgtUHJheWVyDQo+PiA8cGllcnJlLWVyaWMucGVsbG91
eC1wcmF5ZXJAYW1kLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4NCg0KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4NCg0KPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICA0ICsrLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICAgIHwgMjEgKysrKysrKysrKysrLS0tLS0tLS0tDQo+PiAg
IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
Yw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IGlu
ZGV4IGQ1MzRlMTkyZTI2MC4uNDA1MTZkMjQwMjZjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IEBAIC00MDU0LDEzICs0MDU0LDEzIEBA
IGludCBhbWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+PiAg
ICAgICAgICAgICAgICAgIHJldHVybiByOw0KPj4gICAgICAgICAgfQ0KPj4NCj4+ICsgICAgICAg
YW1kZ3B1X2RldmljZV9zZXRfbWNicChhZGV2KTsNCj4+ICsNCj4+ICAgICAgICAgIC8qIGVhcmx5
IGluaXQgZnVuY3Rpb25zICovDQo+PiAgICAgICAgICByID0gYW1kZ3B1X2RldmljZV9pcF9lYXJs
eV9pbml0KGFkZXYpOw0KPj4gICAgICAgICAgaWYgKHIpDQo+PiAgICAgICAgICAgICAgICAgIHJl
dHVybiByOw0KPj4NCj4+IC0gICAgICAgYW1kZ3B1X2RldmljZV9zZXRfbWNicChhZGV2KTsNCj4+
IC0NCj4+ICAgICAgICAgIC8qIEdldCByaWQgb2YgdGhpbmdzIGxpa2Ugb2ZmYiAqLw0KPj4gICAg
ICAgICAgciA9IGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2ZyYW1lYnVmZmVy
cyhhZGV2LT5wZGV2LCAmYW1kZ3B1X2ttc19kcml2ZXIpOw0KPj4gICAgICAgICAgaWYgKHIpDQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+PiBpbmRleCAxNjlkNDUy
NjhlZjYuLmY2ODJmODMwZjdmNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OV8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMNCj4+IEBAIC0yMDgwLDcgKzIwODAsNyBAQCBzdGF0aWMgaW50IGdmeF92OV8wX3N3
X2luaXQodm9pZCAqaGFuZGxlKQ0KPj4gICAgICAgICAgICAgICAgICByaW5nLT5kb29yYmVsbF9p
bmRleCA9DQo+PiBhZGV2LT5kb29yYmVsbF9pbmRleC5nZnhfcmluZzAgPDwgMTsNCj4+DQo+PiAg
ICAgICAgICAgICAgICAgIC8qIGRpc2FibGUgc2NoZWR1bGVyIG9uIHRoZSByZWFsIHJpbmcgKi8N
Cj4+IC0gICAgICAgICAgICAgICByaW5nLT5ub19zY2hlZHVsZXIgPSB0cnVlOw0KPj4gKyAgICAg
ICAgICAgICAgIHJpbmctPm5vX3NjaGVkdWxlciA9IGFkZXYtPmdmeC5tY2JwOw0KPj4gICAgICAg
ICAgICAgICAgICByaW5nLT52bV9odWIgPSBBTURHUFVfR0ZYSFVCKDApOw0KPj4gICAgICAgICAg
ICAgICAgICByID0gYW1kZ3B1X3JpbmdfaW5pdChhZGV2LCByaW5nLCAxMDI0LCAmYWRldi0+Z2Z4
LmVvcF9pcnEsDQo+Pg0KPj4gQU1ER1BVX0NQX0lSUV9HRlhfTUUwX1BJUEUwX0VPUCwgQEAgLTIw
OTAsNyArMjA5MCw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc3dfaW5pdCh2b2lkICpoYW5kbGUp
DQo+PiAgICAgICAgICB9DQo+Pg0KPj4gICAgICAgICAgLyogc2V0IHVwIHRoZSBzb2Z0d2FyZSBy
aW5ncyAqLw0KPj4gLSAgICAgICBpZiAoYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3MpIHsNCj4+ICsg
ICAgICAgaWYgKGFkZXYtPmdmeC5tY2JwICYmIGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzKSB7DQo+
PiAgICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBHRlg5X05VTV9TV19HRlhfUklOR1M7
IGkrKykgew0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJpbmcgPSAmYWRldi0+Z2Z4LnN3
X2dmeF9yaW5nW2ldOw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJpbmctPnJpbmdfb2Jq
ID0gTlVMTDsgQEAgLTIxODEsNyArMjE4MSw3IEBADQo+PiBzdGF0aWMgaW50IGdmeF92OV8wX3N3
X2Zpbmkodm9pZCAqaGFuZGxlKQ0KPj4gICAgICAgICAgaW50IGk7DQo+PiAgICAgICAgICBzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsN
Cj4+DQo+PiAtICAgICAgIGlmIChhZGV2LT5nZngubnVtX2dmeF9yaW5ncykgew0KPj4gKyAgICAg
ICBpZiAoYWRldi0+Z2Z4Lm1jYnAgJiYgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3MpIHsNCj4+ICAg
ICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IEdGWDlfTlVNX1NXX0dGWF9SSU5HUzsgaSsr
KQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9yaW5nX2ZpbmkoJmFkZXYtPmdm
eC5zd19nZnhfcmluZ1tpXSk7DQo+PiAgICAgICAgICAgICAgICAgIGFtZGdwdV9yaW5nX211eF9m
aW5pKCZhZGV2LT5nZngubXV4ZXIpOw0KPj4gQEAgLTU5MTAsMTEgKzU5MTAsMTQgQEAgc3RhdGlj
IGludCBnZnhfdjlfMF9lb3BfaXJxKHN0cnVjdA0KPj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+
DQo+PiAgICAgICAgICBzd2l0Y2ggKG1lX2lkKSB7DQo+PiAgICAgICAgICBjYXNlIDA6DQo+PiAt
ICAgICAgICAgICAgICAgaWYgKGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzICYmDQo+PiAtICAgICAg
ICAgICAgICAgICAgICFhbWRncHVfbWNicF9oYW5kbGVfdHJhaWxpbmdfZmVuY2VfaXJxKCZhZGV2
LT5nZngubXV4ZXIpKSB7DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAvKiBGZW5jZSBzaWdu
YWxzIGFyZSBoYW5kbGVkIG9uIHRoZSBzb2Z0d2FyZSByaW5ncyovDQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgR0ZYOV9OVU1fU1dfR0ZYX1JJTkdTOyBpKyspDQo+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9mZW5jZV9wcm9jZXNzKCZh
ZGV2LT5nZnguc3dfZ2Z4X3JpbmdbaV0pOw0KPj4gKyAgICAgICAgICAgICAgIGlmIChhZGV2LT5n
ZngubnVtX2dmeF9yaW5ncykgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFhZGV2
LT5nZngubWNicCkgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVf
ZmVuY2VfcHJvY2VzcygmYWRldi0+Z2Z4LmdmeF9yaW5nWzBdKTsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIH0gZWxzZSBpZiAoIWFtZGdwdV9tY2JwX2hhbmRsZV90cmFpbGluZ19mZW5jZV9p
cnEoJmFkZXYtPmdmeC5tdXhlcikpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogRmVuY2Ugc2lnbmFscyBhcmUgaGFuZGxlZCBvbiB0aGUgc29mdHdhcmUgcmluZ3MqLw0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgR0ZYOV9O
VU1fU1dfR0ZYX1JJTkdTOyBpKyspDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYW1kZ3B1X2ZlbmNlX3Byb2Nlc3MoJmFkZXYtPmdmeC5zd19nZnhfcmluZ1tpXSk7
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICB9DQo+PiAgICAgICAgICAgICAgICAgIH0NCj4+
ICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+PiAgICAgICAgICBjYXNlIDE6DQo+PiBAQCAtNzA1
MSw3ICs3MDU0LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfc2V0X3JpbmdfZnVuY3Moc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+PiAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgYWRldi0+
Z2Z4Lm51bV9nZnhfcmluZ3M7IGkrKykNCj4+ICAgICAgICAgICAgICAgICAgYWRldi0+Z2Z4Lmdm
eF9yaW5nW2ldLmZ1bmNzID0NCj4+ICZnZnhfdjlfMF9yaW5nX2Z1bmNzX2dmeDsNCj4+DQo+PiAt
ICAgICAgIGlmIChhZGV2LT5nZngubnVtX2dmeF9yaW5ncykgew0KPj4gKyAgICAgICBpZiAoYWRl
di0+Z2Z4Lm1jYnAgJiYgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3MpIHsNCj4+ICAgICAgICAgICAg
ICAgICAgZm9yIChpID0gMDsgaSA8IEdGWDlfTlVNX1NXX0dGWF9SSU5HUzsgaSsrKQ0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5zd19nZnhfcmluZ1tpXS5mdW5jcyA9ICZn
ZnhfdjlfMF9zd19yaW5nX2Z1bmNzX2dmeDsNCj4+ICAgICAgICAgIH0NCj4+IC0tDQo+PiAyLjQw
LjENCj4+DQoNCg==
