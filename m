Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B3787BD97
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Mar 2024 14:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A771910E891;
	Thu, 14 Mar 2024 13:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qiWJL7U6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E0B10E891
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Mar 2024 13:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToYuWQlzIU0gh8KifvTPgJMN/SXJLm5/AK8IENB9R+66N0Qa78OuKA/WSzmzLDpuOBcjIXHxlq4MOg8ItrEWpJl3gvCQO9nDwpNuriQFkBjrfQNxNygY0iKQQvWbDvYmUJhvXfTq/PXtdD8QThBZl3WnmS5fRBskGEnz5NxT2OJQpTKCLdLMopaEceIdqjWzEXBkCorXfaO646XJb+jXV3+zGangXJtheh1/EJpo/5phbXsFWBU7IaFEnBozGx+NUr+ZNjMusAKME8rC0I9jxTm6idP0eq4NmGdVWrTJXtWWx/BTGZhU2nCkb4WCphOBpMjuv6pPLCBdwjlRERwb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKlEqVy/USH/I7rbLV8QkiY58boAb0epBAg/9e/+c2I=;
 b=LEZ7/kpPnepsKK97BaNH4J0YFlxLtW2zalfJFVoyH/I71cJ5dPi2Y4oEu8S1bC7pItz6LUYTxF20uJLTyxk8HPJz68pLnUvOK3jsY6vCsq+31RENFIZ+MAHyfngPf0AE53aD8ggiy+Qy3i3XKJ7PszpDpoQgCAmjyEuPZ0ZCDoGO184VWR7YyIjulGQXOIDOnYIvtT6f/SoC4E7l9Z+XkTTgbirljKgsQ4F/JdYiDA4lXz/aWXS5M9OsArCJ9tr5dIDXmutp6g5c8j90dszaes+7NPLXGKBq4GtHNNPadgfr9LzBQQ18A8pjhJA8tLrMpOEvffjn7bcg6ezotGB9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKlEqVy/USH/I7rbLV8QkiY58boAb0epBAg/9e/+c2I=;
 b=qiWJL7U6nrjtDH8c+iLyhP9RYd3MmIS2rjeyphq82AuKGPK4il8IOM6QZixGk4N4yAMOWFz1uPnKZ7LOuwlZ8c5PTlsHi34g6N7DhX42TiQDKsa2JufiKPgHhATCKBfoXOIc6d0K1/jLtOkDtPHSaifzCHWMjTIV8kj8s7D3LhI=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by PH7PR12MB5712.namprd12.prod.outlook.com (2603:10b6:510:1e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Thu, 14 Mar
 2024 13:24:37 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::74e4:f50f:79af:c996]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::74e4:f50f:79af:c996%7]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 13:24:37 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Pillai, 
 Aurabindo" <Aurabindo.Pillai@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Bypass display ta if it is harvested
Thread-Topic: [PATCH] drm/amdgpu: Bypass display ta if it is harvested
Thread-Index: AQHadft+955yxBUZ9E6NS4nvb3LuxLE3N9eAgAAAtDA=
Date: Thu, 14 Mar 2024 13:24:37 +0000
Message-ID: <BN9PR12MB5257D21D0AB3AB51FDF6D64FFC292@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20240314103620.27165-1-Hawking.Zhang@amd.com>
 <CADnq5_NmJDvia+jL1Zy97=QSnjauX-p-_61CeDmDqPhxPNeN-g@mail.gmail.com>
In-Reply-To: <CADnq5_NmJDvia+jL1Zy97=QSnjauX-p-_61CeDmDqPhxPNeN-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f3dc1338-a4e9-4ade-b853-2e6ac2c85d5c;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-14T13:19:33Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|PH7PR12MB5712:EE_
x-ms-office365-filtering-correlation-id: 0826ec85-de2c-42c8-1771-08dc442a18fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jjmA4QvXgSUmqT7avnL8L6ayplWjANntPzB/XrlM2n5Zg8K2/QT+CqsL4XEsLRg0DThdTEioVUgY1J2p+hxf2CJtN0jYDmz+aBRYbKBmOxGHd0LxelSKQTT9x77dcIsLcm9PUHod0BqXoOAovrDLFgZ5FOlYxpo15yim2UVWdw4Ht/gS6suD2f4nscYHFQffCOrvg+yw65xx9oOgbvpABHtSH2cpSeGHaiTwOxe2plpReHbHnytr2B9VDSvMQtTgBB/l/ANOscx57pDm8srvaEPRmhnnJ+4f1pAXTpP93IdJDplp6rcNGIeGSbNRnqXHaDbMQIbrB+eJ8/m2yPzOoP57dpi7gg3O7iH5zJHRt8OBUcA9M3dwzoMhyuCmYNzFJscSR3rYvRf63nqKF5GQlDgh2MP6KmOidkDB5vyq5IwVjU8DOZIr1E4cgh95bUF/4eBNGsV2d4up8+H5o+ALVOV0DX7epgk+CjY/1LbGX/PkHqco6IEH6D2CpgQd0SXYMUzkhJf2UCXqjO0YshoKMPV7BVP3JHEUt4bYIrWIoVjiy/3arqNR7OuyqukH/agg5Vi7Kxz77QTRbEBxImqD+lnZ9uRqccNmgKqGxnD+FGuJDSnvI8I4u9676iEOw4BKXbJ1aMmWgFPqDg19T/5gC6r20hM62pw4YH3y7wzwURC9vS4jIFa1dtPaFuG2QgKRaDdLforaDgMSiRNtCUjDAhOQ2Kpc7IS5KY4ExgnwNBU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjlHSFk1SktLdytUN1RuL2R3VUl4cXduT20xbHFpNjFTZEFTVVF3SndtYmI0?=
 =?utf-8?B?cU5KU1lYN2E3dHpkZlhSV2Z0SGhQNTRLVS9KL2x2em1sYzVPaTRuYVVqWGUz?=
 =?utf-8?B?WFhKM0NCd3BqMUw2aDVXd0VDeDRxTzNpTmlpVXJBR1BtUnpoai9wNEh0WTB5?=
 =?utf-8?B?aWVHUmMyUTdOSDVRVzRrRkg0SmxaNExEbGJrQlZWblBwbnd1SUF1T2F1enNU?=
 =?utf-8?B?RnczU0lubFdId1pDUFJKTFZENEltNkZ6cm1tdlh5M0xaNXJGaUgzdVFCMWhs?=
 =?utf-8?B?S0tWTGk1NHBTTnBwRlRUTkswTm16cXg5eWZ6eUFzNXk3bVZLZGpOSWNtVjRT?=
 =?utf-8?B?MEpsM2tlZFNCZWNPblJXVWZLM0lEYk92V0M2WjdKS3Z0OTFzMzZxTGQvRWtU?=
 =?utf-8?B?N091azM5WCtYL1NFLytzVGtSb2ZMTER2bk5OL1M4cFFzbjFXMjJPUlZubnhF?=
 =?utf-8?B?MW1oYXpXeXR0K29HdnFtdGtlWGFIVlM5T1ZYOW9lZkFUUFprQ2pxd0xNdUlL?=
 =?utf-8?B?VXRicm1PNTlxb0FWS0pVM1ZFcGdHUmVzNUdqM0xzQ25meTBSU2VXelphUUtO?=
 =?utf-8?B?MDF4eXRrRjc1RE53MUxDN1ZERDZsZDhndG1NTzMwQllHRFBQZjhFamZHMDlo?=
 =?utf-8?B?UDlLdEZ1dDhJckhabzhjOHREbHJScHh4MW9UTEV3YnZqSUNxMlNqbEZ5ZmF0?=
 =?utf-8?B?Mkp1c1AyZnhFb0ZETzcrVjdRUmwvYnVRaU4vcGhUR3NvWDlzU0k0bk5TaXZy?=
 =?utf-8?B?akdjdzRlZ3FXUjZNSzZGeTNGSElYUjRlSC9LbHZEWU9rR0I0WEFPeFk0a2FJ?=
 =?utf-8?B?V1NCaCtiUWY1Z1o3SlMxNjN2ZTIxZmQzY3VzSXIwa241ZW1OczQ1enI1UWV0?=
 =?utf-8?B?d3BkZnI5dk11ckJLUXk5YUw0LzN6cVBqNmFMMTBVTTREY0JpUHRkRTA2eUJ2?=
 =?utf-8?B?NkdoN1kyeHBNWUh4UFJScmFuRUduQzQ0V2dqdEpGcTNmSVhXd3VacFRRRDFW?=
 =?utf-8?B?SmhRL0RjRkpWSkRDMnZ4bVI2eks5UDZxNlpLS3AyV2l0Qyt4RXQvL2hlSFls?=
 =?utf-8?B?TjFpdlNqQXBGTGRJdkY3NTIzMk0raEluVnpnU0QxLzVkT3krTEc5VDlnQ0Z5?=
 =?utf-8?B?L09WY1VhNW9tV2dnS3ZTbURDaThPcmRPL2Z5aHVkNGI0eDBWLzFZM3RpSURy?=
 =?utf-8?B?ZWM4Q0poblQ5WHBGZkgwME94NEdZQXZPZk9GRlpPWFVzVjA3M1loK2VLZDg0?=
 =?utf-8?B?dGR3UW9ocmtTdllHeUVNM1JlTmsyS0l0QlFtS0F5RzhCMnB3R1VhdlJOZEdr?=
 =?utf-8?B?V3l1d1FUeXJaamExM3hFYkdGNTZJYUF4YlVTZlMyd243VjBjYzlKSW9TR0E5?=
 =?utf-8?B?SWlGelcrcmVOcjV0MlYrZzliNmMxOTgrR0lxdGZYVmVhY0x3ZHExNlJ6RUw1?=
 =?utf-8?B?YklrT3BmeHVBS2tGZ1BqckVWZ0NSS1ZVQm9Qd1E1VEVneEJ1N01pZXp4NEtR?=
 =?utf-8?B?QUQyOEQ4KzloTnFiVTl5VkFiZzFNVzljelQ4aHdQdmtuT1ZybEgrWW9UQU0z?=
 =?utf-8?B?Mk9EbHlWWmN4aGJGWXd3NnRXY1o0NEtQNFB2dXBUdDhBZ3pJb0UyQTRmakE3?=
 =?utf-8?B?M0haYVE4cno1eGI5S2k3MmgxWFFEc3EzRjQxVmljRGdiOE9LbXcrWkNRMWd2?=
 =?utf-8?B?eC9aNEVML0pCZXVwbUR2QnJkU1NOc2g0a1ZFTmZ2dUE3VVBqcEdWY0ZzNEc5?=
 =?utf-8?B?RWRaYlZXRStlNVZMNlJTOUtjbUZvYUtBUlo2WlZ3cU5nTVpZWTVwaUJqL3oz?=
 =?utf-8?B?QWhNejQwcVRXK2pvUFgrNGFTMm9UYnFEaXllbnV3OE9tZGVwalN3a3o2bE5n?=
 =?utf-8?B?NTA5LytBQlFZQnduU2FMaXg3Y0pNTzMwdUFtWGtoMmRWbWtyak80ZjdnR0w2?=
 =?utf-8?B?OW1BYWFQVWN0V2g3aGcxektYN2hHTXBHY2x6MTk0M25LTWE0YnVzZ3VMeHpE?=
 =?utf-8?B?cVFENURMcFVIdC9Ra24zN3V0VG03ZzV1TGxEcXBaS0JhL1NUQkRWQmRVQWc4?=
 =?utf-8?B?MkJIQXpwV205Q2NsUmVzSk9wd3c0MlIyR1hBd2xlSHpRSVF1bERrbTVHQ3pO?=
 =?utf-8?Q?TOv4RP90MsACyjNR2vD/j5SsO?=
Content-Type: multipart/alternative;
 boundary="_000_BN9PR12MB5257D21D0AB3AB51FDF6D64FFC292BN9PR12MB5257namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0826ec85-de2c-42c8-1771-08dc442a18fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 13:24:37.7796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVWEvdjGaMKEVvm1Dbbb+XZAnfiA/BkvGBJMOE8MvU/aeQB2bxw0pt1Ggh9Gv5RW8uCEOBITxQgeAHQIGMoxag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5712
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

--_000_BN9PR12MB5257D21D0AB3AB51FDF6D64FFC292BN9PR12MB5257namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCg0KSGkgQWxleCwNCg0KUGxlYXNl
IGNoZWNrIG15IGNvbW1lbnRzIGlubGluZS4gUGxlYXNlIGFsc28gY2hlY2sgdjIgd2hlcmUgSSBz
d2l0Y2ggdG8gYW4gZXhpc3RpbmcgaGVscGVyIHRvIGNoZWNrIGlzIGRpc3BsYXkgaGFyZHdhcmUg
aXMgYXZhaWxhYmxlLg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQpTZW50
OiBUaHVyc2RheSwgTWFyY2ggMTQsIDIwMjQgMjE6MTcNClRvOiBaaGFuZywgSGF3a2luZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPg0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBQ
aWxsYWksIEF1cmFiaW5kbyA8QXVyYWJpbmRvLlBpbGxhaUBhbWQuY29tPjsgRmVuZywgS2VubmV0
aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1
OiBCeXBhc3MgZGlzcGxheSB0YSBpZiBpdCBpcyBoYXJ2ZXN0ZWQNCg0KT24gVGh1LCBNYXIgMTQs
IDIwMjQgYXQgNjo0N+KAr0FNIEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbTxt
YWlsdG86SGF3a2luZy5aaGFuZ0BhbWQuY29tPj4gd3JvdGU6DQo+DQo+IERpc3BsYXkgVEEgZG9l
c24ndCBuZWVkIHRvIGJlIGxvYWRlZC9pbnZva2VkIGlmIGl0IGlzIGhhcnZlc3RlZC4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPG1haWx0
bzpIYXdraW5nLlpoYW5nQGFtZC5jb20+Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuYyB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYw0KPiBpbmRleCA4NjczOTdmZTJlOWQuLmJiNDk4OGM0NWNhOSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYw0KPiBAQCAtMTgzMCw2ICsx
ODMwLDEwIEBAIHN0YXRpYyBpbnQgcHNwX2hkY3BfaW5pdGlhbGl6ZShzdHJ1Y3QgcHNwX2NvbnRl
eHQgKnBzcCkNCj4gICAgICAgICBpZiAoYW1kZ3B1X3NyaW92X3ZmKHBzcC0+YWRldikpDQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCj4NCj4gKyAgICAgICAvKiBieXBhc3MgaGRjcCBpbml0
aWFsaXphdGlvbiBpZiBkbXUgaXMgaGFydmVzdGVkICovDQo+ICsgICAgICAgaWYgKHBzcC0+YWRl
di0+aGFydmVzdF9pcF9tYXNrICYgQU1EX0hBUlZFU1RfSVBfRE1VX01BU0spDQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMDsNCj4gKw0KPiAgICAgICAgIGlmICghcHNwLT5oZGNwX2NvbnRleHQu
Y29udGV4dC5iaW5fZGVzYy5zaXplX2J5dGVzIHx8DQo+ICAgICAgICAgICAgICFwc3AtPmhkY3Bf
Y29udGV4dC5jb250ZXh0LmJpbl9kZXNjLnN0YXJ0X2FkZHIpIHsNCj4gICAgICAgICAgICAgICAg
IGRldl9pbmZvKHBzcC0+YWRldi0+ZGV2LCAiSERDUDogb3B0aW9uYWwgaGRjcCB0YSB1Y29kZQ0K
PiBpcyBub3QgYXZhaWxhYmxlXG4iKTsgQEAgLTE4NjIsNiArMTg2Niw5IEBAIGludCBwc3BfaGRj
cF9pbnZva2Uoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsIHVpbnQzMl90IHRhX2NtZF9pZCkNCj4g
ICAgICAgICBpZiAoYW1kZ3B1X3NyaW92X3ZmKHBzcC0+YWRldikpDQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gMDsNCj4NCj4gKyAgICAgICBpZiAoIXBzcC0+aGRjcF9jb250ZXh0LmNvbnRleHQu
aW5pdGlhbGl6ZWQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gKw0KPiAgICAgICAg
IHJldHVybiBwc3BfdGFfaW52b2tlKHBzcCwgdGFfY21kX2lkLA0KPiAmcHNwLT5oZGNwX2NvbnRl
eHQuY29udGV4dCk7ICB9DQo+DQo+IEBAIC0xODk3LDYgKzE5MDQsMTAgQEAgc3RhdGljIGludCBw
c3BfZHRtX2luaXRpYWxpemUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApDQo+ICAgICAgICAgaWYg
KGFtZGdwdV9zcmlvdl92Zihwc3AtPmFkZXYpKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7
DQo+DQo+ICsgICAgICAgLyogYnlwYXNzIGR0bSBpbml0aWFsaXphdGlvbiBpZiBkbXUgaXMgaGFy
dmVzdGVkICovDQo+ICsgICAgICAgaWYgKHBzcC0+YWRldi0+aGFydmVzdF9pcF9tYXNrICYgQU1E
X0hBUlZFU1RfSVBfRE1VX01BU0spDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCg0KSSB0
aGluayB0aGVyZSBtYXkgYmUgc29tZSBTS1VzIHdoZXJlIHRoZSBkaXNwbGF5IGJsb2NrcyBhcmUg
bm90IGhhcnZlc3RlZCwgYnV0IHRoZXkgYXJlIG5vdCB1c2VkIHNvIHRoZSBhdG9tYmlvcyB0YWJs
ZXMgYXJlIGVtcHR5Lg0KVGhpcyBnZXRzIGZpeGVkIHVwIGluIGRtX2Vhcmx5X2luaXQoKSBzbyB0
aGUgaGFydmVzdCBmbGFnIHNob3VsZCBiZSBzZXQgYnkgdGhlIGVuZCBvZiBlYXJseV9pbml0LiAg
VGhhdCBzaG91bGQgY29tZSBiZWZvcmUgdGhpcyBjb2RlIGdldHMgY2FsbGVkIHNvIEkgdGhpbmsg
d2Ugc2hvdWxkIGJlIGZpbmUuDQoNCltIYXdraW5nXTogWWVzLiBpdCBjb21lcyBiZWZvcmUgcHNw
X2h3X2luaXQuIHNvIHdlIGtub3cgZGlzcGxheSBoYXJkd2FyZSBpcyBub3QgYXZhaWxhYmxlIGJl
Zm9yZSBsb2FkaW5nIHBzcCBmaXJtd2FyZQ0KDQo+ICsNCj4gICAgICAgICBpZiAoIXBzcC0+ZHRt
X2NvbnRleHQuY29udGV4dC5iaW5fZGVzYy5zaXplX2J5dGVzIHx8DQo+ICAgICAgICAgICAgICFw
c3AtPmR0bV9jb250ZXh0LmNvbnRleHQuYmluX2Rlc2Muc3RhcnRfYWRkcikgew0KPiAgICAgICAg
ICAgICAgICAgZGV2X2luZm8ocHNwLT5hZGV2LT5kZXYsICJEVE06IG9wdGlvbmFsIGR0bSB0YSB1
Y29kZQ0KPiBpcyBub3QgYXZhaWxhYmxlXG4iKTsgQEAgLTE5MjksNiArMTk0MCw5IEBAIGludCBw
c3BfZHRtX2ludm9rZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCwgdWludDMyX3QgdGFfY21kX2lk
KQ0KPiAgICAgICAgIGlmIChhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkNCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAwOw0KPg0KPiArICAgICAgIGlmICghcHNwLT5kdG1fY29udGV4dC5jb250
ZXh0LmluaXRpYWxpemVkKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7DQoNCkRvZXNuJ3Qg
dGhlIGR0bV9pbml0aWFsaXplIGZ1bmN0aW9uIG5lZWQgYSBoYXJ2ZXN0IGNoZWNrPw0KDQpbSGF3
a2luZ106IHllcywgdGhlIHNhbWUgY2hlY2sgaXMgYXBwbGllZCBmb3IgZHRtDQorICAgICAgIC8q
IGJ5cGFzcyBkdG0gaW5pdGlhbGl6YXRpb24gaWYgZG11IGlzIGhhcnZlc3RlZCAqLw0KKyAgICAg
ICBpZiAocHNwLT5hZGV2LT5oYXJ2ZXN0X2lwX21hc2sgJiBBTURfSEFSVkVTVF9JUF9ETVVfTUFT
SykNCisgICAgICAgICAgICAgICByZXR1cm4gMDsNCisNCg0KDQo+ICsNCj4gICAgICAgICByZXR1
cm4gcHNwX3RhX2ludm9rZShwc3AsIHRhX2NtZF9pZCwNCj4gJnBzcC0+ZHRtX2NvbnRleHQuY29u
dGV4dCk7ICB9DQo+DQo+IEBAIC0yMDYzLDYgKzIwNzcsMTAgQEAgc3RhdGljIGludCBwc3Bfc2Vj
dXJlZGlzcGxheV9pbml0aWFsaXplKHN0cnVjdCBwc3BfY29udGV4dCAqcHNwKQ0KPiAgICAgICAg
IGlmIChhbWRncHVfc3Jpb3ZfdmYocHNwLT5hZGV2KSkNCj4gICAgICAgICAgICAgICAgIHJldHVy
biAwOw0KPg0KPiArICAgICAgIC8qIGJ5cGFzcyBzZWN1cmVkaXNwbGF5IGluaXRpYWxpemF0aW9u
IGlmIGRtdSBpcyBoYXJ2ZXN0ZWQgKi8NCj4gKyAgICAgICBpZiAocHNwLT5hZGV2LT5oYXJ2ZXN0
X2lwX21hc2sgJiBBTURfSEFSVkVTVF9JUF9ETVVfTUFTSykNCj4gKyAgICAgICAgICAgICAgICBy
ZXR1cm4gMDsNCg0KRG9uJ3Qgd2UgbmVlZCB0byBjaGVjayBpZiB0aGUgY29udGV4dCBpcyBpbml0
aWFsaXplZCBpbiBwc3Bfc2VjdXJlZGlzcGxheV9pbnZva2UoKT8NCg0KW0hhd2tpbmddOiBUaGUg
Y2hlY2sgaXMgYWxyZWFkeSBpbiBwc3Bfc2VjdXJlZGlzcGxheV9pbnZva2UuDQoNCj4gKw0KPiAg
ICAgICAgIGlmICghcHNwLT5zZWN1cmVkaXNwbGF5X2NvbnRleHQuY29udGV4dC5iaW5fZGVzYy5z
aXplX2J5dGVzIHx8DQo+ICAgICAgICAgICAgICFwc3AtPnNlY3VyZWRpc3BsYXlfY29udGV4dC5j
b250ZXh0LmJpbl9kZXNjLnN0YXJ0X2FkZHIpIHsNCj4gICAgICAgICAgICAgICAgIGRldl9pbmZv
KHBzcC0+YWRldi0+ZGV2LCAiU0VDVVJFRElTUExBWTogc2VjdXJlZGlzcGxheQ0KPiB0YSB1Y29k
ZSBpcyBub3QgYXZhaWxhYmxlXG4iKTsNCj4gLS0NCj4gMi4xNy4xDQo+DQo=

--_000_BN9PR12MB5257D21D0AB3AB51FDF6D64FFC292BN9PR12MB5257namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+DQo8IS0tIGNvbnZlcnRlZCBmcm9tIHJ0ZiAt
LT4NCjxzdHlsZT48IS0tIC5FbWFpbFF1b3RlIHsgbWFyZ2luLWxlZnQ6IDFwdDsgcGFkZGluZy1s
ZWZ0OiA0cHQ7IGJvcmRlci1sZWZ0OiAjODAwMDAwIDJweCBzb2xpZDsgfSAtLT48L3N0eWxlPg0K
PC9oZWFkPg0KPGJvZHk+DQo8Zm9udCBmYWNlPSJBcmlhbCIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMHB0OyI+DQo8ZGl2IHN0eWxlPSJwYWRkaW5nLXJpZ2h0OjVwdDtwYWRkaW5n
LWxlZnQ6NXB0OyI+PGZvbnQgY29sb3I9ImJsdWUiPltBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBH
ZW5lcmFsXTxicj4NCg0KPC9mb250PjwvZGl2Pg0KPGRpdiBzdHlsZT0ibWFyZ2luLXRvcDo1cHQ7
Ij48Zm9udCBmYWNlPSJUaW1lcyBOZXcgUm9tYW4iIHNpemU9IjMiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTJwdDsiPjxicj4NCg0KPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFj
ZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+SGkgQWxl
eCw8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIy
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mbmJzcDs8L3NwYW4+PC9mb250PjwvZGl2
Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExcHQ7Ij5QbGVhc2UgY2hlY2sgbXkgY29tbWVudHMgaW5saW5lLiBQbGVhc2UgYWxzbyBj
aGVjayB2MiB3aGVyZSBJIHN3aXRjaCB0byBhbiBleGlzdGluZyBoZWxwZXIgdG8gY2hlY2sgaXMg
ZGlzcGxheSBoYXJkd2FyZSBpcyBhdmFpbGFibGUuPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+
PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0
OyI+Jm5ic3A7PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIg
c2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+UmVnYXJkcyw8YnI+DQoNCkhh
d2tpbmc8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXpl
PSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mbmJzcDs8L3NwYW4+PC9mb250Pjwv
ZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExcHQ7Ij4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTxicj4NCg0KRnJvbTogQWxl
eCBEZXVjaGVyICZsdDthbGV4ZGV1Y2hlckBnbWFpbC5jb20mZ3Q7IDxicj4NCg0KU2VudDogVGh1
cnNkYXksIE1hcmNoIDE0LCAyMDI0IDIxOjE3PGJyPg0KDQpUbzogWmhhbmcsIEhhd2tpbmcgJmx0
O0hhd2tpbmcuWmhhbmdAYW1kLmNvbSZndDs8YnI+DQoNCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgUGlsbGFpLCBBdXJhYmluZG8gJmx0O0F1cmFiaW5kby5QaWxsYWlAYW1kLmNv
bSZndDs7IEZlbmcsIEtlbm5ldGggJmx0O0tlbm5ldGguRmVuZ0BhbWQuY29tJmd0Ozxicj4NCg0K
U3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogQnlwYXNzIGRpc3BsYXkgdGEgaWYgaXQg
aXMgaGFydmVzdGVkPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJy
aSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jm5ic3A7PC9zcGFuPjwv
Zm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMXB0OyI+T24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgNjo0N+KAr0FNIEhh
d2tpbmcgWmhhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzpIYXdraW5nLlpoYW5nQGFtZC5jb20iPkhh
d2tpbmcuWmhhbmdAYW1kLmNvbTwvYT4mZ3Q7IHdyb3RlOjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8
ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTFwdDsiPiZndDs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJp
IiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7IERpc3BsYXkgVEEg
ZG9lc24ndCBuZWVkIHRvIGJlIGxvYWRlZC9pbnZva2VkIGlmIGl0IGlzIGhhcnZlc3RlZC48L3Nw
YW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+
PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0
OyI+Jmd0OyBTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nICZsdDs8YSBocmVmPSJtYWlsdG86
SGF3a2luZy5aaGFuZ0BhbWQuY29tIj5IYXdraW5nLlpoYW5nQGFtZC5jb208L2E+Jmd0Ozwvc3Bh
bj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsgLS0tPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxk
aXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MXB0OyI+Jmd0OyZuYnNwOyBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMg
fCAxOCArKysrKysrKysrKysrKysrKys8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBm
YWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7
Jm5ic3A7IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspPC9zcGFuPjwvZm9udD48L2Rp
dj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMXB0OyI+Jmd0Ozwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNh
bGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsgZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyA8L3NwYW4+PC9m
b250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3BzcC5jPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIg
c2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyBpbmRleCA4NjczOTdm
ZTJlOWQuLmJiNDk4OGM0NWNhOSAxMDA2NDQ8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9u
dCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4m
Z3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYzwvc3Bhbj48
L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5jPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2Fs
aWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyBAQCAtMTgz
MCw2ICsxODMwLDEwIEBAIHN0YXRpYyBpbnQgcHNwX2hkY3BfaW5pdGlhbGl6ZShzdHJ1Y3QgcHNw
X2NvbnRleHQgKnBzcCk8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxp
YnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChhbWRncHVfc3Jpb3Zf
dmYocHNwLSZndDthZGV2KSk8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJD
YWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiAwOzwvc3Bhbj48L2ZvbnQ+
PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTFwdDsiPiZndDs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNl
PSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7ICsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgLyogYnlwYXNzIGhkY3AgaW5pdGlh
bGl6YXRpb24gaWYgZG11IGlzIGhhcnZlc3RlZCAqLzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2
Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFw
dDsiPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAocHNwLSZn
dDthZGV2LSZndDtoYXJ2ZXN0X2lwX21hc2sgJmFtcDsgQU1EX0hBUlZFU1RfSVBfRE1VX01BU0sp
PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHJldHVybiAwOzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNh
bGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsgKzwvc3Bh
bj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCFwc3AtJmd0O2hkY3BfY29udGV4dC5jb250ZXh0LmJp
bl9kZXNjLnNpemVfYnl0ZXMgfHw8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNl
PSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICFwc3AtJmd0O2hkY3BfY29udGV4dC5jb250ZXh0LmJpbl9kZXNjLnN0YXJ0
X2FkZHIpIHs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBz
aXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGRldl9pbmZvKHBzcC0mZ3Q7YWRldi0mZ3Q7ZGV2LCAm
cXVvdDtIRENQOiBvcHRpb25hbCBoZGNwIHRhIHVjb2RlIDwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8
ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTFwdDsiPiZndDsgaXMgbm90IGF2YWlsYWJsZVxuJnF1b3Q7KTsgQEAgLTE4NjIsNiArMTg2Niw5
IEBAIGludCBwc3BfaGRjcF9pbnZva2Uoc3RydWN0IHBzcF9jb250ZXh0ICpwc3AsIHVpbnQzMl90
IHRhX2NtZF9pZCk8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJp
IiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChhbWRncHVfc3Jpb3ZfdmYo
cHNwLSZndDthZGV2KSk8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxp
YnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiAwOzwvc3Bhbj48L2ZvbnQ+PC9k
aXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTFwdDsiPiZndDs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJD
YWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7ICsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCFwc3AtJmd0O2hkY3BfY29udGV4
dC5jb250ZXh0LmluaXRpYWxpemVkKTwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZh
Y2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsg
KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gMDs8L3NwYW4+PC9mb250PjwvZGl2
Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExcHQ7Ij4mZ3Q7ICs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJD
YWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiBwc3BfdGFf
aW52b2tlKHBzcCwgdGFfY21kX2lkLCA8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBm
YWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7
ICZhbXA7cHNwLSZndDtoZGNwX2NvbnRleHQuY29udGV4dCk7Jm5ic3A7IH08L3NwYW4+PC9mb250
PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExcHQ7Ij4mZ3Q7PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFj
ZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyBA
QCAtMTg5Nyw2ICsxOTA0LDEwIEBAIHN0YXRpYyBpbnQgcHNwX2R0bV9pbml0aWFsaXplKHN0cnVj
dCBwc3BfY29udGV4dCAqcHNwKTwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9
IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKGFtZGdwdV9z
cmlvdl92Zihwc3AtJmd0O2FkZXYpKTwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZh
Y2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIDA7PC9zcGFuPjwv
Zm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0Ozwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250
IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZn
dDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAvKiBieXBhc3MgZHRtIGlu
aXRpYWxpemF0aW9uIGlmIGRtdSBpcyBoYXJ2ZXN0ZWQgKi88L3NwYW4+PC9mb250PjwvZGl2Pg0K
PGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExcHQ7Ij4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKHBz
cC0mZ3Q7YWRldi0mZ3Q7aGFydmVzdF9pcF9tYXNrICZhbXA7IEFNRF9IQVJWRVNUX0lQX0RNVV9N
QVNLKTwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9
IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsgKyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyByZXR1cm4gMDs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNl
PSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mbmJzcDs8
L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij5JIHRoaW5rIHRoZXJlIG1heSBiZSBzb21lIFNL
VXMgd2hlcmUgdGhlIGRpc3BsYXkgYmxvY2tzIGFyZSBub3QgaGFydmVzdGVkLCBidXQgdGhleSBh
cmUgbm90IHVzZWQgc28gdGhlIGF0b21iaW9zIHRhYmxlcyBhcmUgZW1wdHkuPC9zcGFuPjwvZm9u
dD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMXB0OyI+VGhpcyBnZXRzIGZpeGVkIHVwIGluIGRtX2Vhcmx5X2luaXQoKSBz
byB0aGUgaGFydmVzdCBmbGFnIHNob3VsZCBiZSBzZXQgYnkgdGhlIGVuZCBvZiBlYXJseV9pbml0
LiZuYnNwOyBUaGF0IHNob3VsZCBjb21lIGJlZm9yZSB0aGlzIGNvZGUgZ2V0cyBjYWxsZWQgc28g
SSB0aGluayB3ZSBzaG91bGQgYmUgZmluZS48L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9u
dCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4m
bmJzcDs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXpl
PSIyIiBjb2xvcj0iIzJGNTQ5NiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+W0hhd2tp
bmddOiBZZXMuIGl0IGNvbWVzIGJlZm9yZSBwc3BfaHdfaW5pdC4gc28gd2Uga25vdyBkaXNwbGF5
IGhhcmR3YXJlIGlzIG5vdCBhdmFpbGFibGUgYmVmb3JlIGxvYWRpbmcgcHNwIGZpcm13YXJlPC9z
cGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jm5ic3A7PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxk
aXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MXB0OyI+Jmd0OyArPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJy
aSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAoIXBzcC0mZ3Q7ZHRtX2Nv
bnRleHQuY29udGV4dC5iaW5fZGVzYy5zaXplX2J5dGVzIHx8PC9zcGFuPjwvZm9udD48L2Rpdj4N
CjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMXB0OyI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAhcHNwLSZndDtkdG1fY29udGV4dC5jb250ZXh0
LmJpbl9kZXNjLnN0YXJ0X2FkZHIpIHs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBm
YWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGRldl9pbmZvKHBzcC0mZ3Q7
YWRldi0mZ3Q7ZGV2LCAmcXVvdDtEVE06IG9wdGlvbmFsIGR0bSB0YSB1Y29kZSA8L3NwYW4+PC9m
b250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7IGlzIG5vdCBhdmFpbGFibGVcbiZxdW90Oyk7IEBAIC0x
OTI5LDYgKzE5NDAsOSBAQCBpbnQgcHNwX2R0bV9pbnZva2Uoc3RydWN0IHBzcF9jb250ZXh0ICpw
c3AsIHVpbnQzMl90IHRhX2NtZF9pZCk8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBm
YWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChhbWRn
cHVfc3Jpb3ZfdmYocHNwLSZndDthZGV2KSk8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9u
dCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4m
Z3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiAwOzwvc3Bh
bj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48
Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7
Ij4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCFwc3AtJmd0
O2R0bV9jb250ZXh0LmNvbnRleHQuaW5pdGlhbGl6ZWQpPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxk
aXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MXB0OyI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiAwOzwvc3Bhbj48
L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTFwdDsiPiZuYnNwOzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxm
b250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsi
PkRvZXNuJ3QgdGhlIGR0bV9pbml0aWFsaXplIGZ1bmN0aW9uIG5lZWQgYSBoYXJ2ZXN0IGNoZWNr
Pzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZuYnNwOzwvc3Bhbj48L2ZvbnQ+PC9kaXY+
DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiIGNvbG9yPSIjMkY1NDk2Ij48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij5bSGF3a2luZ106IHllcywgdGhlIHNhbWUgY2hlY2sg
aXMgYXBwbGllZCBmb3IgZHRtPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0i
Q2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+KyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAvKiBieXBhc3MgZHRtIGluaXRpYWxpemF0aW9u
IGlmIGRtdSBpcyBoYXJ2ZXN0ZWQgKi88L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBm
YWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4rJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChwc3AtJmd0O2FkZXYtJmd0O2hh
cnZlc3RfaXBfbWFzayAmYW1wOyBBTURfSEFSVkVTVF9JUF9ETVVfTUFTSyk8L3NwYW4+PC9mb250
PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExcHQ7Ij4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiAwOzwv
c3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPis8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48
Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIiBjb2xvcj0iIzJGNTQ5NiI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMXB0OyI+Jm5ic3A7PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQg
ZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jm5i
c3A7PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0i
MiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyArPC9zcGFuPjwvZm9udD48L2Rp
dj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMXB0OyI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyByZXR1cm4gcHNwX3RhX2ludm9rZShwc3AsIHRhX2NtZF9pZCwgPC9zcGFuPjwvZm9u
dD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyAmYW1wO3BzcC0mZ3Q7ZHRtX2NvbnRleHQuY29udGV4dCk7
Jm5ic3A7IH08L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBz
aXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7PC9zcGFuPjwvZm9udD48
L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMXB0OyI+Jmd0OyBAQCAtMjA2Myw2ICsyMDc3LDEwIEBAIHN0YXRpYyBpbnQgcHNw
X3NlY3VyZWRpc3BsYXlfaW5pdGlhbGl6ZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCk8L3NwYW4+
PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChhbWRncHVfc3Jpb3ZfdmYocHNwLSZndDthZGV2KSk8L3Nw
YW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHJldHVybiAwOzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZh
Y2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDs8
L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgLyogYnlwYXNzIHNlY3VyZWRpc3BsYXkgaW5pdGlhbGl6YXRpb24gaWYg
ZG11IGlzIGhhcnZlc3RlZCAqLzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9
IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsgKyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpZiAocHNwLSZndDthZGV2LSZndDto
YXJ2ZXN0X2lwX21hc2sgJmFtcDsgQU1EX0hBUlZFU1RfSVBfRE1VX01BU0spPC9zcGFuPjwvZm9u
dD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMXB0OyI+Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IHJldHVybiAwOzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmki
IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZuYnNwOzwvc3Bhbj48L2Zv
bnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTFwdDsiPkRvbid0IHdlIG5lZWQgdG8gY2hlY2sgaWYgdGhlIGNvbnRleHQg
aXMgaW5pdGlhbGl6ZWQgaW4gcHNwX3NlY3VyZWRpc3BsYXlfaW52b2tlKCk/PC9zcGFuPjwvZm9u
dD48L2Rpdj4NCjxkaXY+PGZvbnQgZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMXB0OyI+Jm5ic3A7PC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQg
ZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiIgY29sb3I9IiMyRjU0OTYiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTFwdDsiPltIYXdraW5nXTogVGhlIGNoZWNrIGlzIGFscmVhZHkgaW4gcHNwX3NlY3Vy
ZWRpc3BsYXlfaW52b2tlLjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNh
bGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZuYnNwOzwvc3Bh
bj48L2ZvbnQ+PC9kaXY+DQo8ZGl2Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTFwdDsiPiZndDsgKzwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2
Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFw
dDsiPiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
aWYgKCFwc3AtJmd0O3NlY3VyZWRpc3BsYXlfY29udGV4dC5jb250ZXh0LmJpbl9kZXNjLnNpemVf
Ynl0ZXMgfHw8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBz
aXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
ICFwc3AtJmd0O3NlY3VyZWRpc3BsYXlfY29udGV4dC5jb250ZXh0LmJpbl9kZXNjLnN0YXJ0X2Fk
ZHIpIHs8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXpl
PSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGRldl9pbmZvKHBzcC0mZ3Q7YWRldi0mZ3Q7ZGV2LCAmcXVv
dDtTRUNVUkVESVNQTEFZOiBzZWN1cmVkaXNwbGF5IDwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8ZGl2
Pjxmb250IGZhY2U9IkNhbGlicmkiIHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFw
dDsiPiZndDsgdGEgdWNvZGUgaXMgbm90IGF2YWlsYWJsZVxuJnF1b3Q7KTs8L3NwYW4+PC9mb250
PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBzaXplPSIyIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExcHQ7Ij4mZ3Q7IC0tPC9zcGFuPjwvZm9udD48L2Rpdj4NCjxkaXY+PGZvbnQg
ZmFjZT0iQ2FsaWJyaSIgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+Jmd0
OyAyLjE3LjE8L3NwYW4+PC9mb250PjwvZGl2Pg0KPGRpdj48Zm9udCBmYWNlPSJDYWxpYnJpIiBz
aXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQ7Ij4mZ3Q7PC9zcGFuPjwvZm9udD48
L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_BN9PR12MB5257D21D0AB3AB51FDF6D64FFC292BN9PR12MB5257namp_--
