Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED20163C5B
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Feb 2020 06:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4257B6E423;
	Wed, 19 Feb 2020 05:05:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B496E087
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2020 05:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzXs4y6FFegW6KAeLcL/oDzG2h8jRNwOCAr+lFPmE7ov8yuJnnAwB9zhIw/pNc6PhZ8CjebE6Boeyej4+zLmB/VG4H0EBvwLRN2/ScReHBj4zjs8Z2VrkZ7ujOin6aSPRmUibbVtkn4OwWS1a/oyeRtYLukrQcPY7hGiBDMPAfkI3JOTVAnkd6y/kRkpbdGJUWL4z/rcVJZWUZq795paddhI4GNiiDnOhlWDwnnx+8/RDMxTaavkPQ2nPuB32Rb02jX8jh2sn6rbq7chEAQwRcLGX0OnvV0HUStlzjdGSV8dX257uA83TAfcFaE9uwdIxpbBPdsY8bzSb4e5PB/9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StPd6UCCCu8AH0e5LYn8bqE/3QEo2GNdHkxq4LrILEA=;
 b=nYYcrPi9R8veso0u/Cx/5fjEsKi6WeOeGXM/ZCU7Z+chazkHGeSVfMwWO6fddeWT5utdxOzOGuSFdb9c/ZAAzIJjJvAJmBHIcZn9qAowOFv/pe6uyM5voIGwBnDNagCCkB8FDmOOsblT/pQ8MNQ6n/ei5XA2e0jE9bX9V3jvAd3nIZ52g8YIfZleBEyy08yxZXH8XKIbm1JQLaNOSQEnQb5juf+SNuLTjWwQOsoGoKzymg+sTS+65we28FyUKkEc/oNMihwKUMrwC9e2fjwKbsxh3wDuzeZGJHYIrg0v3jInwi0ngHU6p3bJm8UOPBylFK8upxnuyLlZqZ9NG8/vKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StPd6UCCCu8AH0e5LYn8bqE/3QEo2GNdHkxq4LrILEA=;
 b=NFlAAmjIjqbnFhv6nOClnBuC4FKHFDiVswuaGIrbxUdMnsuwYiBcmuw1RKVOsEer5QviwI3k4f0PegdT4eDatl6H7zYPBpYsqeI6F+F4HEJ9Q97QjX3vovuRIZWY3uuv3JevgsVD+PYFUAuie/OdmOPimP38086bVL6cOfthNBo=
Received: from DM6PR12MB3931.namprd12.prod.outlook.com (10.255.174.140) by
 DM6PR12MB3436.namprd12.prod.outlook.com (20.178.30.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Wed, 19 Feb 2020 05:05:30 +0000
Received: from DM6PR12MB3931.namprd12.prod.outlook.com
 ([fe80::c51d:4e6b:f0f1:b7a3]) by DM6PR12MB3931.namprd12.prod.outlook.com
 ([fe80::c51d:4e6b:f0f1:b7a3%7]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 05:05:30 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMy8zXSBkcm0vYW1kZ3B1OiBmaXggY29sbGlkaW5n?=
 =?utf-8?Q?_of_preemption?=
Thread-Topic: [PATCH 3/3] drm/amdgpu: fix colliding of preemption
Thread-Index: AQHV5ga7OM0WAZZyvUCj+DK+6PEWzqgg0gYAgAAEfICAAAnkcIAAKjOAgADtdjA=
Date: Wed, 19 Feb 2020 05:05:30 +0000
Message-ID: <DM6PR12MB393180A8253BF2297A48BC6084100@DM6PR12MB3931.namprd12.prod.outlook.com>
References: <1581994453-5498-1-git-send-email-Monk.Liu@amd.com>
 <1581994453-5498-3-git-send-email-Monk.Liu@amd.com>
 <DM5PR12MB1418C6AC8DAC7F035AC2DCEBFC110@DM5PR12MB1418.namprd12.prod.outlook.com>
 <DM5PR12MB1418D0DB790F1CE215545BBDFC110@DM5PR12MB1418.namprd12.prod.outlook.com>
 <MN2PR12MB393375DD0B47A374C7856FE484110@MN2PR12MB3933.namprd12.prod.outlook.com>
 <DM5PR12MB1418815CC40285E1EF58831EFC110@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB1418815CC40285E1EF58831EFC110@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-02-18T11:31:58Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=39b9d887-b8d7-489b-af40-000004217956;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b954e4d8-985b-4d65-b62e-08d7b4f9577b
x-ms-traffictypediagnostic: DM6PR12MB3436:|DM6PR12MB3436:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB34367B91822D141198FF20DB84100@DM6PR12MB3436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(189003)(199004)(110136005)(966005)(52536014)(55016002)(26005)(5660300002)(478600001)(71200400001)(66556008)(66946007)(8936002)(81166006)(33656002)(224303003)(81156014)(45080400002)(7696005)(316002)(76116006)(86362001)(2906002)(66476007)(9686003)(53546011)(6506007)(64756008)(186003)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3436;
 H:DM6PR12MB3931.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: waJGwrzzPsrIUXdmVctcVJwljlxAonWv5l8bn0b+OdLYjqrOczdDp/wuXoDYGqrlaUbMOt+VfPcux5cqZHZmqqo6dajiKe9xQxpu6DE/Pcv3nYh63tKQEGNkRweq6VjCUin6Cn+EWl4QHR8uYDn0bGFY8yJwZH/wq6JiTg2cmqwCVDK8XdTCX91CyknxLQAuDTr28R6Y+PZSn3C+o4f2tJtK8PlJL+ovDg2bslXTmM3IkqrR0nykcRZxc+/aThvjKwvrWuD3qLkEJC7QHgXWG6tQULIL07yeUGEw9/d4gnRADG71JaMbQH1MnQpgvCwTSn9biq7Guibs/PwaPb6I7NBYndOPVduDdFSyvhVX77od6AW1Uoo2CQGpOcC7tjil4tNnV251Cq9GPsRr9qbco8k3+X3GRnlyDclYb683l41m6wDi5x+TkgX2AVsrLA3HPkrpVwYE7eTVzmIBs7ioRcBlxrBzgN3Bv5d5aH7IGmZkZIA3FRksU9qYof8hCmd0CzemvES0xjbJOgpfz6r7Sw==
x-ms-exchange-antispam-messagedata: NiX8D4HYpZjtbIX4NDlWRvZrC3JC7PyU4AnVODv9rMCrhAF5Czh4f91QRXSsyznzymePUN7+aVQEHOZ+6b03egIn1tySo1d9lQ4jaKB7ojvVFiNU5vJjIZUe7FTLVzP2iiUcqoBcPWBuk0f9dFfs0g==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b954e4d8-985b-4d65-b62e-08d7b4f9577b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 05:05:30.2297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UNb7zur3On+d86n2/JgYKvbHuClUI76kJ1WtI4fw1Wb5wUT54EtzzqRVvCE8U+Mv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3436
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Pj4gSSBkb24ndCB3YW50IHRvIG1peCBvcyBwcmVlbXB0aW9uIHdpdGggd29ybGQgc3dpdGNoIGhl
cmUuIEknbSBqdXN0IHRyeWluZyB0byBzZWUgd2hldGhlciB3ZSBjYW4gbGV2ZXJhZ2UgdGhlIGNv
ZGUgcGF0aCBhcyBtdWNoIGFzIHBvc3NpYmxlLCBpLmUuIENTQSByZWxhdGVkIGNvZGUgcGF0aC4N
Cg0KWWVhaCwgSSBhZ3JlZSB3aXRoIHRoYXQgDQoNCj4+IEJ1dCBJJ2QgbGlrZSB0byB0YWtlIGFu
b3RoZXIgY2hhbmNlIHRvIHJldmlldyBhbGwgdGhlIGV4aXN0aW5nIG1jYnAgY29kZSB3aXRoIEph
Y2sgYW5kIHlvdSB0byBzZWUgYW55IHJvb20gZm9yIGltcHJvdmVtZW50DQoNClN1cmUsIGxldCBt
ZSBrbm93IHdoZW4geW91IHdhbnQgdG8gZG8gdGhpcywgd2UgY2FuIGRpc2N1c3MgdG9nZXRoZXIg
b24gdGhlIE1DQlAgdG9waWMgDQoNClRoYW5rcyAhDQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0N
CuWPkeS7tuS6ujogWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4gDQrlj5Hp
gIHml7bpl7Q6IDIwMjDlubQy5pyIMTjml6UgMjI6NTUNCuaUtuS7tuS6ujogTGl1LCBNb25rIDxN
b25rLkxpdUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCuS4u+mimDog
UkU6IFtQQVRDSCAzLzNdIGRybS9hbWRncHU6IGZpeCBjb2xsaWRpbmcgb2YgcHJlZW1wdGlvbg0K
DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQoN
CkhpIE1vbmssDQoNCkkgZG9uJ3Qgd2FudCB0byBtaXggb3MgcHJlZW1wdGlvbiB3aXRoIHdvcmxk
IHN3aXRjaCBoZXJlLiBJJ20ganVzdCB0cnlpbmcgdG8gc2VlIHdoZXRoZXIgd2UgY2FuIGxldmVy
YWdlIHRoZSBjb2RlIHBhdGggYXMgbXVjaCBhcyBwb3NzaWJsZSwgaS5lLiBDU0EgcmVsYXRlZCBj
b2RlIHBhdGguIA0KDQpTcGVjaWZpYyBmb3IgdGhlIHNyaW92IGNoZWNrIGluIHlvdXIgcGF0Y2gs
IGFzIEkgbWVudGlvbmVkIGJlZm9yZSwgdGhleSBhcmUgZmFpciBlbm91Z2guIFlvdSBjYW4gaGF2
ZSBteSBBQ0sgZm9yIHBhdGNoICMzLiBCdXQgSSdkIGxpa2UgdG8gdGFrZSBhbm90aGVyIGNoYW5j
ZSB0byByZXZpZXcgYWxsIHRoZSBleGlzdGluZyBtY2JwIGNvZGUgd2l0aCBKYWNrIGFuZCB5b3Ug
dG8gc2VlIGFueSByb29tIGZvciBpbXByb3ZlbWVudC4gDQoNClJlZ2FyZHMsDQpIYXdraW5nDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQu
Y29tPiANClNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDE4LCAyMDIwIDIwOjMwDQpUbzogWmhhbmcs
IEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpTdWJqZWN0OiDlm57lpI06IFtQQVRDSCAzLzNdIGRybS9hbWRncHU6IGZpeCBjb2xs
aWRpbmcgb2YgcHJlZW1wdGlvbg0KDQpFdmVuIG5vdCB0YWxraW5nIGFib3V0IENFL0RFIG1ldGEg
YW5kIFNETUEgQ1MsIHdlIHN0aWxsIGNhbm5vdCBzaGFyZSBhbWRncHVfbWNicCB3aXRoIFNSSU9W
IGNhc2UsICBlLmcuOiANCkluIHNvbWUgcGxhY2Ugd2UgdXNlICJpZiAoYW1kZ3B1X21jYnAgfHwg
YW1kZ3B1X3NyaW92X3ZmKCkiIHRvIGNoZWNrLCBhbmQgd2UgZG8gdGhlIHNhbWUgdGhpbmcgdW5k
ZXIgdGhhdCBjb25kaXRpb24sIEJ1dCB3ZSBjYW5ub3QgZG8gdGhhdCB0aGluZyBieSAiaWYgKGFt
ZGdwdV9tY2JwKSIgYW5kIHNldCAiYW1kZ3B1X21jYnAiIHRvIHRydWUgdW5kZXIgU1JJT1YgY2Fz
ZS4gQmVjYXVzZSB0aGF0IHdpbGwgbGV0IE9TIHByZWVtcHRpb24gd29yaywgd2hpY2ggd2lsbCB0
cmlnZ2VyIG1pc21hdGNoL2NydXNoIGluIENQRyBzaWRlIGR1cmluZyB0aGUgTUNCUC4gKG5vdCBz
dXJlIGlmIENXU1IgaGFzIHN1Y2ggY29sbGlkaW5nKQ0KDQpTbyB3ZSBhbHdheXMgbmVlZCB0byBk
aXNhYmxlIE9TIHByZWVtcHRpb24gYmVoYXZpb3IgZm9yIFNSSU9WIChkb24ndCB0byBwcmVlbXB0
IGFuIElCIGJ5IHRvdWNoIHZtaWRfcHJlZW1wdCByZWdpc3RlciwgYW5kIG5vIElCIHJlc3VtZSBo
YXBwZW4pDQoNClRoYW5rcyANCg0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6
IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+DQrlj5HpgIHml7bpl7Q6IDIw
MjDlubQy5pyIMTjml6UgMTk6NDgNCuaUtuS7tuS6ujogWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcu
WmhhbmdAYW1kLmNvbT47IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQrmioTpgIE6IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT4N
CuS4u+mimDogUkU6IFtQQVRDSCAzLzNdIGRybS9hbWRncHU6IGZpeCBjb2xsaWRpbmcgb2YgcHJl
ZW1wdGlvbg0KDQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9u
IE9ubHldDQoNCkFoaGguLi4uIFNlbmQgaXQgdG9vIHF1aWNrbHkuIE9mIGNvdXJzZSwgd2Ugc3Rp
bGwgbmVlZCB0byBhcHBseSB2ZiBjaGVjayBmb3IgY2UvZGUtbWV0YSwgYnV0IEkgdGhpbmsgaW4g
c3VjaCB3YXksIHdlIGNhbiBkcmFtYXRpY2FsbHkgcmVkdWNlIHRoZSBhbWRncHVfc2lyb3ZfdmYg
Y2hlY2sgaW4gZXZlcnkgbWNicCBjb2RlIHBhdGguDQoNClJlZ2FyZHMsDQpIYXdraW5nDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWmhhbmcsIEhhd2tpbmcNClNlbnQ6
IFR1ZXNkYXksIEZlYnJ1YXJ5IDE4LCAyMDIwIDE5OjMyDQpUbzogTGl1LCBNb25rIDxNb25rLkxp
dUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBMaXUsIE1vbmsg
PE1vbmsuTGl1QGFtZC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIIDMvM10gZHJtL2FtZGdwdTog
Zml4IGNvbGxpZGluZyBvZiBwcmVlbXB0aW9uDQoNCltBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBJ
bnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCg0KSXQncyBzb21lIGtpbmQgb2YgYW5ub3lpbmcg
dG8gY2hlY2sgdmYgaW4gZXZlcnkgcGxhY2UgdGhhdCBpcyByZXF1aXJlZCBmb3IgbWNicCB1bnRp
bCBhbWRncHVfbWNicCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuIFdoYXQncyBtb3JlLCB3aGVuIGFt
ZGdwdV9tY2JwIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCwgdGhlcmUgd2lsbCBiZSBtYW55IHVubmVj
ZXNzYXJ5IHZmIGNoZWNrIHRoYXQgY2FuIGJlIHJlbW92ZWQgYXMgbW9zdCBvZiBtY2JwIGZ1bmN0
aW9uIGFjdHVhbGx5IGNhbiBiZSBzaGFyZWQgYmV0d2VlbiB3b3JsZCBzd2l0Y2ggcHJlZW1wdGlv
biBhbmQgb3MgcHJlZW1wdGlvbi4NCg0KSSdkIHByZWZlciB0byBlbmFibGUgYW1kZ3B1X21jYnAg
Zm9yIHNyaW92IGluIGFtZGdwdV9kZXZpY2VfY2hlY2tfYXJndW1lbnRzIHRvIHJlZHVjZSB0aGUg
dmYgc3BlY2lmaWMgY2hlY2sgZXZlcnl3aGVyZS4NCg0KUmVnYXJkcywNCkhhd2tpbmcNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBNb25rIExpdQ0KU2VudDogVHVlc2Rh
eSwgRmVicnVhcnkgMTgsIDIwMjAgMTA6NTQNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KQ2M6IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAz
LzNdIGRybS9hbWRncHU6IGZpeCBjb2xsaWRpbmcgb2YgcHJlZW1wdGlvbg0KDQp3aGF0Og0Kc29t
ZSBvcyBwcmVlbXB0aW9uIHBhdGggaXMgbWVzc2VkIHVwIHdpdGggd29ybGQgc3dpdGNoIHByZWVt
cHRpb24NCg0KZml4Og0KY2xlYW51cCB0aG9zZSBsb2dpY3Mgc28gb3MgcHJlZW1wdGlvbiBub3Qg
bWl4ZWQgd2l0aCB3b3JsZCBzd2l0Y2gNCg0KdGhpcyBwYXRjaCBpcyBhIGdlbmVyYWwgZml4IGZv
ciBpc3N1ZXMgY29tZXMgZnJvbSBTUklPViBNQ0JQLCBidXQgdGhlcmUgaXMgc3RpbGwgVU1EIHNp
ZGUgaXNzdWVzIG5vdCByZXNvdmx2ZWQgeWV0LCBzbyB0aGlzIHBhdGNoIGNhbm5vdCBmaXggYWxs
IHdvcmxkIHN3aXRjaCBidWcuDQoNClNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBh
bWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuYyB8
IDMgKystDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgICB8IDggKysr
Ky0tLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zZG1hLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5jDQppbmRleCBhMmVlMzBi
Li43ODU0YzA1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3NkbWEuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuYw0K
QEAgLTcwLDcgKzcwLDggQEAgdWludDY0X3QgYW1kZ3B1X3NkbWFfZ2V0X2NzYV9tY19hZGRyKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywNCiAJdWludDMyX3QgaW5kZXggPSAwOw0KIAlpbnQgcjsN
CiANCi0JaWYgKHZtaWQgPT0gMCB8fCAhYW1kZ3B1X21jYnApDQorCS8qIGRvbid0IGVuYWJsZSBP
UyBwcmVlbXB0aW9uIG9uIFNETUEgdW5kZXIgU1JJT1YgKi8NCisJaWYgKGFtZGdwdV9zcmlvdl92
ZihhZGV2KSB8fCB2bWlkID09IDAgfHwgIWFtZGdwdV9tY2JwKQ0KIAkJcmV0dXJuIDA7DQogDQog
CXIgPSBhbWRncHVfc2RtYV9nZXRfaW5kZXhfZnJvbV9yaW5nKHJpbmcsICZpbmRleCk7IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQppbmRleCA1ZTlmYjA5Li43YjYxNTgzIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQpAQCAtNDQxMyw3ICs0NDEz
LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3JpbmdfZW1pdF9pYl9nZngoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLA0KIA0KIAljb250cm9sIHw9IGliLT5sZW5ndGhfZHcgfCAodm1pZCA8PCAy
NCk7DQogDQotCWlmIChhbWRncHVfbWNicCAmJiAoaWItPmZsYWdzICYgQU1ER1BVX0lCX0ZMQUdf
UFJFRU1QVCkpIHsNCisJaWYgKChhbWRncHVfc3Jpb3ZfdmYocmluZy0+YWRldikgfHwgYW1kZ3B1
X21jYnApICYmIChpYi0+ZmxhZ3MgJg0KK0FNREdQVV9JQl9GTEFHX1BSRUVNUFQpKSB7DQogCQlj
b250cm9sIHw9IElORElSRUNUX0JVRkZFUl9QUkVfRU5CKDEpOw0KIA0KIAkJaWYgKGZsYWdzICYg
QU1ER1BVX0lCX1BSRUVNUFRFRCkNCkBAIC00NDIxLDcgKzQ0MjEsNyBAQCBzdGF0aWMgdm9pZCBn
ZnhfdjEwXzBfcmluZ19lbWl0X2liX2dmeChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQogDQog
CQlpZiAoIShpYi0+ZmxhZ3MgJiBBTURHUFVfSUJfRkxBR19DRSkpDQogCQkJZ2Z4X3YxMF8wX3Jp
bmdfZW1pdF9kZV9tZXRhKHJpbmcsDQotCQkJCSAgICBmbGFncyAmIEFNREdQVV9JQl9QUkVFTVBU
RUQgPyB0cnVlIDogZmFsc2UpOw0KKwkJCQkgICAgKCFhbWRncHVfc3Jpb3ZfdmYocmluZy0+YWRl
dikgJiYgZmxhZ3MgJiBBTURHUFVfSUJfUFJFRU1QVEVEKSA/IA0KK3RydWUgOiBmYWxzZSk7DQog
CX0NCiANCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgaGVhZGVyKTsNCkBAIC00NTY5LDkgKzQ1
NjksOSBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X2NudHhjbnRsKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywgIHsNCiAJdWludDMyX3QgZHcyID0gMDsNCiANCi0JaWYgKGFtZGdw
dV9tY2JwKQ0KKwlpZiAoYW1kZ3B1X21jYnAgfHwgYW1kZ3B1X3NyaW92X3ZmKHJpbmctPmFkZXYp
KQ0KIAkJZ2Z4X3YxMF8wX3JpbmdfZW1pdF9jZV9tZXRhKHJpbmcsDQotCQkJCSAgICBmbGFncyAm
IEFNREdQVV9JQl9QUkVFTVBURUQgPyB0cnVlIDogZmFsc2UpOw0KKwkJCQkgICAgKCFhbWRncHVf
c3Jpb3ZfdmYocmluZy0+YWRldikgJiYgZmxhZ3MgJiBBTURHUFVfSUJfUFJFRU1QVEVEKSA/IA0K
K3RydWUgOiBmYWxzZSk7DQogDQogCWR3MiB8PSAweDgwMDAwMDAwOyAvKiBzZXQgbG9hZF9lbmFi
bGUgb3RoZXJ3aXNlIHRoaXMgcGFja2FnZSBpcyBqdXN0IE5PUHMgKi8NCiAJaWYgKGZsYWdzICYg
QU1ER1BVX0hBVkVfQ1RYX1NXSVRDSCkgew0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9y
ZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q2hhd2tp
bmcuemhhbmclNDBhbWQuY29tJTdDYTdlNDY1ZWY1ZTMxNDYyZjUzYmIwOGQ3YjQ2NjMxMDMlN0Mz
ZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTc2MjIzMzIzMDE3
OTgzJmFtcDtzZGF0YT13RSUyRld0MzFhNnRDbWM5VHQwdUhNQzFTNVhlUG5BZ1VGTlNsWFJEUDFv
U0UlM0QmYW1wO3Jlc2VydmVkPTANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCmh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0
aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q2hhd2tpbmcuemhhbmclNDBhbWQuY29t
JTdDYTdlNDY1ZWY1ZTMxNDYyZjUzYmIwOGQ3YjQ2NjMxMDMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUx
MWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MTc2MjIzMzIzMDE3OTgzJmFtcDtzZGF0YT13RSUy
Rld0MzFhNnRDbWM5VHQwdUhNQzFTNVhlUG5BZ1VGTlNsWFJEUDFvU0UlM0QmYW1wO3Jlc2VydmVk
PTANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
