Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5FE1B491F
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2020 17:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A136EA1D;
	Wed, 22 Apr 2020 15:51:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF9C6EA1D
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Apr 2020 15:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmDOaXzpbEMnTSo3rnIiCpuCWsgZ6hOcCD0JPOYplGrPZFRngavgaJqt65POdpTTzq4NnV7oj1FFv7fn+s15BhFPXcEn+ILKifPXQV7d1jgndx+YOixA0v76MpUgGyCdwzEwd2yKC2VFEtnAoP3/MqjXH0XUAxVbcr4DSC5Z//5wGUouhCz1nTKUR+6O9GQkq1kM2APDX3/nV9CSpi+6nFBFOUbJaDftu8ZBhw2b/GwwvoyqWGerX0RCsc1TfeIIP6aaR6eFCTdY9qJtakqCkp/7wz3UjFhQLM7Uo2lBJGh3VKqNMRs/Dmz/01YZXc9PINbRH+dT6zo0WyrVPtJV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWDyND7OzI303JWrZzEYkvbRku6z0WhmUG91kjrEVKE=;
 b=KbkU6Sqbx2DsjcJ1mY79LByosdG9cEc6+wm05bXTxoulcROST00u2dtXHjpyvpjSuTHWvD4tt3Aadk+7822YZETPml/vcrffvKt5B4XNTIrHcgyBtU5JThISpXUh63vDuTi3Q2VvBz/6ARLnfqPN/cGCCAE7DbwRa9BVFDx0yaGY6rMq9j0R4o+wWA7Wd68aPe4P1k6fCJLxSOfGR59DngeDdyVkAPWYNtr3aNag9kq30Fe3fH+8W1TIhj55rOGhl+Zc8U2Muog2MaJkvq1cRQZzqusVivrZ+soQjNj9dFdAVsDOwqv3vVKWNyjPY6bRSrsYue5mIlEfdttZSTUUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWDyND7OzI303JWrZzEYkvbRku6z0WhmUG91kjrEVKE=;
 b=M0KzDM1iEVmcCEliDV1dA7dcROWRHsyt5Bm1dkJz4as+TZ7zfQtm5DqB5P6zWjTaqI3/loO9f7DKej0lTLz4aU0jBNRWnx6bG28mgQfJmAA2kAtJT26dpXJVwUbysKdh3vHUAFxCGAC6IFSSxoQCdh73kzpZJ1fNPCat+N5KTaQ=
Received: from BYAPR12MB3240.namprd12.prod.outlook.com (2603:10b6:a03:136::28)
 by BYAPR12MB3029.namprd12.prod.outlook.com (2603:10b6:a03:ab::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 15:51:04 +0000
Received: from BYAPR12MB3240.namprd12.prod.outlook.com
 ([fe80::559d:610f:20d3:23bd]) by BYAPR12MB3240.namprd12.prod.outlook.com
 ([fe80::559d:610f:20d3:23bd%7]) with mapi id 15.20.2921.030; Wed, 22 Apr 2020
 15:51:03 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
Subject: RE: [PATCH] drm/amdgpu: request reg_val_offs each kiq read reg
Thread-Topic: [PATCH] drm/amdgpu: request reg_val_offs each kiq read reg
Thread-Index: AQHWGKKymezYJmoTPkG1kAFIlHUUZqiFFXuAgAAiGuCAAAJHgIAAAlAAgAAIT2CAAAOegIAAARgAgAAAKbA=
Date: Wed, 22 Apr 2020 15:51:03 +0000
Message-ID: <BYAPR12MB32409C9B9A769599863F3BDEF4D20@BYAPR12MB3240.namprd12.prod.outlook.com>
References: <20200422123635.30543-1-yttao@amd.com>
 <fae1bbd0-cce4-d33a-5f1b-e97aa8912e13@amd.com>
 <BYAPR12MB3240E8C2DD1F04FBBCD680A5F4D20@BYAPR12MB3240.namprd12.prod.outlook.com>
 <28b87de2-6ec4-3be6-c227-577e2568c7a2@amd.com>
 <MN2PR12MB30398CC40C5822D21E9A15B5E5D20@MN2PR12MB3039.namprd12.prod.outlook.com>
 <BYAPR12MB32402EFD0B2EA60924533D72F4D20@BYAPR12MB3240.namprd12.prod.outlook.com>
 <MN2PR12MB3039D407714E85424991B525E5D20@MN2PR12MB3039.namprd12.prod.outlook.com>
 <MN2PR12MB3039C8C4BE187E209DE6DF38E5D20@MN2PR12MB3039.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3039C8C4BE187E209DE6DF38E5D20@MN2PR12MB3039.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-04-22T15:34:28Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=2d90db1f-daac-4a35-b149-0000edd9a98b;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-04-22T15:51:02Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 966450a1-6d34-456c-b342-00005eb360ba
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
x-originating-ip: [2607:fea8:3bc0:316:7809:5b9c:9bf3:2f61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7b3c21ec-bab6-43ce-d262-08d7e6d4f679
x-ms-traffictypediagnostic: BYAPR12MB3029:|BYAPR12MB3029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB302919CDE8C829C438D60D9CF4D20@BYAPR12MB3029.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3240.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(66446008)(478600001)(966005)(2906002)(316002)(52536014)(8676002)(4326008)(45080400002)(5660300002)(9686003)(110136005)(8936002)(81156014)(55016002)(30864003)(53546011)(6506007)(86362001)(66556008)(66946007)(66476007)(71200400001)(83080400001)(186003)(7696005)(76116006)(6636002)(33656002)(64756008)(66574012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cRSTOvQEfMcRkjYYVi5slJzUZ4P6o6J+tikWKPfjJ5r/gnGE9Hy/5Cm+if/pPJADoQIIg0V7AvxAJRsUrTOTXjIROxLJvwm2Q7ztBNq/dHBuxmRazKMxIQI60J0+8eiYlP91ab8CF8uGYcNDKtX5jGTB333bDME87SkM0HXDPn6uEsRZ7KWOK6trPryAL3kUT/A/vw1SgRmxiZ/BpyF3doopq7/NHmbIgrLxqOHMw/Emm5cn7geqQmUtSBnhKtJQNtgiUrTQgilH/7gFQBFdQzd5lpcuUUBnoQGTO5knJYtHgq6FSV6ZPICSCcS6z+/WeXqAY8IKH4N/vTg501NoNcMoBBVBozqcZgpUhcUUuxOcW3ztpsbcmpPx2NJV9aYi+6CLq8crVR4O6ZTbKO5iZM+99Wa0hpdy2MI/Myg9e9iUYIzCiK+3n5WrXn8HkTjEeZRTve0tlWyvbO3ocDw6FYuh/i/2yrxpZadjju8Gydp3yKmepNQHueunYSlxR9wML5k2leSWE/IDdBaJYtVTzQ==
x-ms-exchange-antispam-messagedata: g0JCpaEw+jbI860YAhipw6dVas/Ag5v/3sNaIQXixBZIOylzZ5a6CQq++2HUWX7AQB7w9WS2HXzwzRhMIFG0gxeoexAjx1tbdx0ph0GAUIncP2TQr5y7w3SlY7UjUWNhmjLkTZSdk6ipa/sf/YwmEs0nueuIGHt9DI4NRu+HvQrC6MH41ptDLSgVmbuvw7NVsMt/YJiY8tJbm4aFrSghrg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3c21ec-bab6-43ce-d262-08d7e6d4f679
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 15:51:03.7199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d5HmI0+5ZVmgV/YUXyXkw4/domRKUMIvoJ/Ue1fQkTXKIh7OdP7odQAeS0FST3jJGoI6/FoCiBgQvlEH9RTQyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3029
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpP
SywgSSBzZWUsIHRoZSBzdWJtaXNzaW9uIGl0IHNlbGYgYmUgc2lnbmFsZWQgc28gdGhlIHJpbmcg
c3BhY2UgZm9yIHRoaXMgc3VibWlzc2lvbiB3aWxsIGJlIHJlLXVzZSBieSBvdGhlciBzdWJtaXNz
aW9uICwgYnV0IHRoZSBDUFUgc3RpbGwgIG5vdCByZWFkIHRoZSBvdXQgcHV0IHZhbHVlIHlldC4g
DQoNClRoYW5rcyANClNoYW95dW4ubGl1DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBUYW8sIFlpbnRpYW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+IA0KU2VudDogV2VkbmVzZGF5
LCBBcHJpbCAyMiwgMjAyMCAxMTo0NyBBTQ0KVG86IFRhbywgWWludGlhbiA8WWludGlhbi5UYW9A
YW1kLmNvbT47IExpdSwgU2hhb3l1biA8U2hhb3l1bi5MaXVAYW1kLmNvbT47IEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFt
ZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRn
cHU6IHJlcXVlc3QgcmVnX3ZhbF9vZmZzIGVhY2gga2lxIHJlYWQgcmVnDQoNCkFkZCBtb3JlIA0K
DQpFc3BlY2lhbGx5IGZvciB0aGUgbXVsdGktVkYgZW52aXJvbm1lbnQsIHdlIGhhdmUgdG8gd2Fp
dCB0aHJvdWdoIG1zbGVlcCgpIGluc3RlYWQgdWRlYXkuDQpCZWNhdXNlIHRoZSBtYXggdWRlbGF5
IHRpbWUgaXMgMTVWRiAqIDZtcyh3b3JsZC1zd2l0Y2gpID0gOTBtcy4NCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFRhbywgWWludGlhbg0KU2VudDogMjAyMOW5tDTm
nIgyMuaXpSAyMzo0Mw0KVG86IExpdSwgU2hhb3l1biA8U2hhb3l1bi5MaXVAYW1kLmNvbT47IEtv
ZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBMaXUsIE1vbmsgPE1v
bmsuTGl1QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
DQpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0hd
IGRybS9hbWRncHU6IHJlcXVlc3QgcmVnX3ZhbF9vZmZzIGVhY2gga2lxIHJlYWQgcmVnDQoNCkhp
ICBTaGFveXVuDQoNCg0KDQpObywgdGhlIHNlY29uZCBwYXRjaCBjYW4ndCBzb2x2ZSB0aGlzIHJh
cmUgY2FzZSBiZWNhdXNlIG9ubHkgU2xvdC1EIGlzIHNpZ25hbGVkIGFuZCB0aGUgU2xvdC1BIGNh
biBiZSBvdmVyd3JpdHRlbi4gDQpUaGUgc2Vjb25kIHBhdGNoIHRoaW5rIHRoZSBzZXF1ZW5jZSBp
cyBzaWduYWxlZCB0aGUgU2xvdC1BIGJ1ZmZlciBjYW4gYmUgZnJlZWQuDQoNCmlmIHlvdSBzdG9y
ZSAgdGhlIG91dHB1dCB2YWx1ZSBpbiBlYWNoIHJpbmcgYnVmZmVyIGl0c2VsZiAsIGVhY2gga2lx
IG9wZXJhdGlvbiB3aWxsIGJlIGF0b21pYyBhbmQgc2VsZiBjb250YWluIC4gIA0KW3l0dGFvXTog
SWYgd2Ugd2FuIHRvIHJlYWxseSBtYWtlIHRoZSBraXEgb3BlcmF0aW9uIGJlIGF0b21pYyB0aGVu
IHdlIGhhdmUgdG8gZG8gdGhlIHRoaW5ncyBiZWxvdzoNCnNwaW5fbG9ja19pcnFzYXZlKCZraXEt
PnJpbmdfbG9jaywgZmxhZ3MpOyAuLi4uLg0KRnVsZmlsbCB0aGUgY29tbWFuZCBidWZmZXINCi4u
Li4uDQogICAgICAgIGlmIChyIDwgMSAmJiAoYWRldi0+aW5fZ3B1X3Jlc2V0IHx8IGluX2ludGVy
cnVwdCgpKSkNCiAgICAgICAgICAgICAgICBnb3RvIGZhaWxlZF9raXFfd3JpdGU7DQoNCiAgICAg
ICAgbWlnaHRfc2xlZXAoKTsNCiAgICAgICAgd2hpbGUgKHIgPCAxICYmIGNudCsrIDwgTUFYX0tJ
UV9SRUdfVFJZKSB7DQoNCiAgICAgICAgICAgICAgICBtc2xlZXAoTUFYX0tJUV9SRUdfQkFJTE9V
VF9JTlRFUlZBTCk7IC8qIGhlcmUgd2lsbCBicmVhayBhdG9taWMgYW5kIHdlIG5lZWQgZGlyZWN0
bHkgdXNlIHVkZWFseSovDQogICAgICAgICAgICAgICAgciA9IGFtZGdwdV9mZW5jZV93YWl0X3Bv
bGxpbmcocmluZywgc2VxLCBNQVhfS0lRX1JFR19XQUlUKTsNCiAgICAgICAgfQ0Kc3Bpbl9sb2Nr
X2lycXJlc3RvcmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7DQoNCg0KQmVzdCBSZWdhcmRzDQpZ
aW50aWFuIFRhbw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IExpdSwgU2hhb3l1
biA8U2hhb3l1bi5MaXVAYW1kLmNvbT4NClNlbnQ6IDIwMjDlubQ05pyIMjLml6UgMjM6MzUNClRv
OiBUYW8sIFlpbnRpYW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsg
S3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiByZXF1
ZXN0IHJlZ192YWxfb2ZmcyBlYWNoIGtpcSByZWFkIHJlZw0KDQpbQU1EIE9mZmljaWFsIFVzZSBP
bmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQoNClRoaXMgaXMgdGhlIGlzc3VlIHlv
dSB0cnkgdG8gc29sdmUgIHdpdGggeW91ciBzZWNvbmQgcGF0Y2ggKHByb3RlY3Qga2lxIG92ZXJy
dW4pIC4gRm9yIGN1cnJlbnQgIHBhdGNoICwgaWYgeW91IHN0b3JlICB0aGUgb3V0cHV0IHZhbHVl
IGluIGVhY2ggcmluZyBidWZmZXIgaXRzZWxmICwgZWFjaCBraXEgb3BlcmF0aW9uIHdpbGwgYmUg
YXRvbWljIGFuZCBzZWxmIGNvbnRhaW4gLiANCg0KU2hhb3l1bi5saXUNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IFRhbywgWWludGlhbiA8WWludGlhbi5UYW9AYW1kLmNvbT4N
ClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjIsIDIwMjAgMTE6MDAgQU0NClRvOiBLb2VuaWcsIENo
cmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgTGl1LCBTaGFveXVuIDxTaGFveXVu
LkxpdUBhbWQuY29tPjsgTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsgS3VlaGxpbmcsIEZl
bGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiByZXF1ZXN0IHJlZ192YWxf
b2ZmcyBlYWNoIGtpcSByZWFkIHJlZw0KDQpIaSAgU2hhb3l1bg0KDQoNClRoZXJlIGlzIG9uZSBy
YXJlIGNvcm5lciBjYXNlIHdoaWNoIHdpbGwgcmFpc2UgcHJvYmxlbSB3aGVuIHVzaW5nIHJpbmcg
YnVmZmVyIHRvIHN0b3JlIHZhbHVlLg0KDQpJdCBpcyBhc3N1bWVkIHRoZXJlIGFyZSBvbmx5IHRv
dGFsIGZvdXIgc2xvdHMgYXQgS0lRIHJpbmcgYnVmZmVyLg0KDQpBbmQgdGhlc2UgZm91ciBzbG90
cyBhcmUgZnVsZmlsbGVkIHdpdGggY29tbWFuZCB0byByZWFkIHJlZ2lzdGVycy4gIFNsb3QtQSBT
bG90LUIgU2xvdC1DIFNsb3QtRA0KDQpBbmQgdGhleSBhcmUgd2FpdGluZyBmb3IgdGhlIHNlcXVl
bmNlIGZlbmNlcyB0byBiZSBzaWduYWxlZC4gSGVyZSwgdGhlcmUgaXMgb25lIG5ldyBjb21tYW5k
IHRvIHdyaXRlIHJlZ2lzdGVyIHRvIGJlIHN1Ym1pdHRlZA0KDQoxLiBTbG90LUEgdW5kZXIgbXNs
ZWVwIG5vdCB0byByZWFkIHJlZ2lzdGVyIDIuIFNsb3QtQiB1bmRlciBtc2xlZXAgbm90IHRvIHJl
YWQgcmVnaXN0ZXIgMy4gU2xvdC1DIHVuZGVyIG1zbGVlcCBub3QgdG8gcmVhZCByZWdpc3Rlci4N
CjQuIFNsb3QtRCBoYXBwZW4gdG8gZmluZCB0aGUgc2VxdWVuY2Ugc2lnbmFsZWQgYW5kIGhlcmUg
dGhlIG5ldyB3cml0ZSBjb21tYW5kIHdpbGwgb3ZlcndyaXRlIHRoZSBTbG90LUEgY29udGVudHMu
DQoNCg0KQmVzdCBSZWdhcmRzDQpZaW50aWFuIFRhbw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4N
ClNlbnQ6IDIwMjDlubQ05pyIMjLml6UgMjI6NTINClRvOiBMaXUsIFNoYW95dW4gPFNoYW95dW4u
TGl1QGFtZC5jb20+OyBUYW8sIFlpbnRpYW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+OyBMaXUsIE1v
bmsgPE1vbmsuTGl1QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+DQpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRybS9hbWRncHU6IHJlcXVlc3QgcmVnX3ZhbF9vZmZzIGVhY2gga2lxIHJlYWQgcmVn
DQoNCkhpIFNoYW95dW4sDQoNCnRoZSByaW5nIGJ1ZmZlciBpcyB1c3VhbGx5IGZpbGxlZCB3aXRo
IGNvbW1hbmQgYW5kIG5vdCByZWFkIHJlc3VsdHMuDQoNCkFsbG9jYXRpbmcgZXh0cmEgc3BhY2Ug
d291bGQgb25seSB3b3JrIGlmIHdlIHVzZSB0aGUgc3BlY2lhbCBOT1AgY29tbWFuZCBhbmQgdGhh
dCBpcyB3YXkgbW9yZSBjb21wbGljYXRlZCBhbmQgZnJhZ2lsZSB0aGFuIGp1c3QgdXNpbmcgdGhl
IHdiIGZ1bmN0aW9ucyB3aGljaCB3aGVyZSBtYWRlIGZvciB0aGlzIHN0dWZmLg0KDQpSZWdhcmRz
LA0KQ2hyaXN0aWFuLg0KDQpBbSAyMi4wNC4yMCB1bSAxNjo0OCBzY2hyaWViIExpdSwgU2hhb3l1
bjoNCj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5
XQ0KPg0KPiBIaSAsWWludGlhbiAmIENocmlzdGlhbg0KPiBJIHN0aWxsIGRvbid0IHVuZGVyc3Rh
bmQgd2h5IHdlIG5lZWQgdGhpcyBjb21wbGljYXRlZCAgY2hhbmdlIGhlcmUgLiBXaHkgY2FuIG5v
dCBqdXN0IGFsbG9jYXRlIGZldyBtb3JlIGV4dHJhIHNwYWNlIGluIHRoZSByaW5nIGZvciBlYWNo
IHJlYWQgIGFuZCB1c2UgdGhlIHNwYWNlIHRvIHN0b3JlIHRoZSBvdXRwdXQgdmFsdWUgID8NCj4N
Cj4gUmVnYXJkcw0KPiBTaGFveXVuLmxpdQ0KPiAgICAgDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZiANCj4gQ2hyaXN0aWFuIEvDtm5pZw0KPiBTZW50OiBXZWRu
ZXNkYXksIEFwcmlsIDIyLCAyMDIwIDg6NDIgQU0NCj4gVG86IFRhbywgWWludGlhbiA8WWludGlh
bi5UYW9AYW1kLmNvbT47IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IA0KPiBLdWVobGlu
ZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiByZXF1ZXN0
IHJlZ192YWxfb2ZmcyBlYWNoIGtpcSByZWFkIA0KPiByZWcNCj4NCj4gQW0gMjIuMDQuMjAgdW0g
MTQ6MzYgc2NocmllYiBZaW50aWFuIFRhbzoNCj4+IEFjY29yZGluZyB0byB0aGUgY3VycmVudCBr
aXEgcmVhZCByZWdpc3RlciBtZXRob2QsIHRoZXJlIHdpbGwgYmUgcmFjZSANCj4+IGNvbmRpdGlv
biB3aGVuIHVzaW5nIEtJUSB0byByZWFkIHJlZ2lzdGVyIGlmIG11bHRpcGxlIGNsaWVudHMgd2Fu
dCB0byANCj4+IHJlYWQgYXQgc2FtZSB0aW1lIGp1c3QgbGlrZSB0aGUgZXhwYW1wbGUgYmVsb3c6
DQo+PiAxLiBjbGllbnQtQSBzdGFydCB0byByZWFkIFJFRy0wIHRocm9ndWggS0lRIDIuIGNsaWVu
dC1BIHBvbGwgdGhlDQo+PiBzZXFuby0wIDMuIGNsaWVudC1CIHN0YXJ0IHRvIHJlYWQgUkVHLTEg
dGhyb3VnaCBLSVEgNC4gY2xpZW50LUIgcG9sbCANCj4+IHRoZSBzZXFuby0xIDUuIHRoZSBraXEg
Y29tcGxldGUgdGhlc2UgdHdvIHJlYWQgb3BlcmF0aW9uIDYuIGNsaWVudC1BIA0KPj4gdG8gcmVh
ZCB0aGUgcmVnaXN0ZXIgYXQgdGhlIHdiIGJ1ZmZlciBhbmQNCj4+ICAgICAgZ2V0IFJFRy0xIHZh
bHVlDQo+Pg0KPj4gVGhlcmVmb3JlLCB1c2UgYW1kZ3B1X2RldmljZV93Yl9nZXQoKSB0byByZXF1
ZXN0IHJlZ192YWxfb2ZmcyBmb3IgDQo+PiBlYWNoIGtpcSByZWFkIHJlZ2lzdGVyLg0KPj4NCj4+
IHYyOiBmaXggdGhlIGVycm9yIHJlbW92ZQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFlpbnRpYW4g
VGFvIDx5dHRhb0BhbWQuY29tPg0KPj4gLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUuaCAgICAgIHwgIDIgKy0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nZnguYyAgfCAxOSArKysrKysrKysrLS0tLS0tLQ0KPj4gICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oICB8ICAxIC0NCj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmggfCAgNSArKystLQ0KPj4gICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgICB8ICA3ICsrKy0tLQ0KPj4gICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyAgICB8ICA3ICsrKy0tLQ0KPj4gICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICB8IDI3ICsrKysrKysrKysrKysr
KystLS0tLS0tLQ0KPj4gICAgNyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyNyBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmgNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+
IGluZGV4IDRlMWQ0Y2ZlN2E5Zi4uN2VlNWE0ZGEzOThhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oDQo+PiBAQCAtNTI2LDcgKzUyNiw3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBhbWRncHVfc2V0X2liX3ZhbHVlKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLA0KPj4g
ICAgLyoNCj4+ICAgICAqIFdyaXRlYmFjaw0KPj4gICAgICovDQo+PiAtI2RlZmluZSBBTURHUFVf
TUFYX1dCIDEyOAkvKiBSZXNlcnZlIGF0IG1vc3QgMTI4IFdCIHNsb3RzIGZvciBhbWRncHUtb3du
ZWQgcmluZ3MuICovDQo+PiArI2RlZmluZSBBTURHUFVfTUFYX1dCIDI1NgkvKiBSZXNlcnZlIGF0
IG1vc3QgMjU2IFdCIHNsb3RzIGZvciBhbWRncHUtb3duZWQgcmluZ3MuICovDQo+PiAgICANCj4+
ICAgIHN0cnVjdCBhbWRncHVfd2Igew0KPj4gICAgCXN0cnVjdCBhbWRncHVfYm8JKndiX29iajsN
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMN
Cj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+PiBpbmRleCBl
YTU3NmI0MjYwYTQuLmQ1YTU5ZDdjNDhkNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dmeC5jDQo+PiBAQCAtMzA0LDEwICszMDQsNiBAQCBpbnQgYW1kZ3B1X2dm
eF9raXFfaW5pdF9yaW5nKHN0cnVjdCANCj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+PiAgICAN
Cj4+ICAgIAlzcGluX2xvY2tfaW5pdCgma2lxLT5yaW5nX2xvY2spOw0KPj4gICAgDQo+PiAtCXIg
PSBhbWRncHVfZGV2aWNlX3diX2dldChhZGV2LCAma2lxLT5yZWdfdmFsX29mZnMpOw0KPj4gLQlp
ZiAocikNCj4+IC0JCXJldHVybiByOw0KPj4gLQ0KPj4gICAgCXJpbmctPmFkZXYgPSBOVUxMOw0K
Pj4gICAgCXJpbmctPnJpbmdfb2JqID0gTlVMTDsNCj4+ICAgIAlyaW5nLT51c2VfZG9vcmJlbGwg
PSB0cnVlOw0KPj4gQEAgLTMzMSw3ICszMjcsNiBAQCBpbnQgYW1kZ3B1X2dmeF9raXFfaW5pdF9y
aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlIA0KPj4gKmFkZXYsDQo+PiAgICANCj4+ICAgIHZvaWQg
YW1kZ3B1X2dmeF9raXFfZnJlZV9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCj4+ICAg
IHsNCj4+IC0JYW1kZ3B1X2RldmljZV93Yl9mcmVlKHJpbmctPmFkZXYsIHJpbmctPmFkZXYtPmdm
eC5raXEucmVnX3ZhbF9vZmZzKTsNCj4+ICAgIAlhbWRncHVfcmluZ19maW5pKHJpbmcpOw0KPj4g
ICAgfQ0KPj4gICAgDQo+PiBAQCAtNjcyLDE1ICs2NjcsMjAgQEAgdWludDMyX3QgYW1kZ3B1X2tp
cV9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcpDQo+PiAgICB7
DQo+PiAgICAJc2lnbmVkIGxvbmcgciwgY250ID0gMDsNCj4+ICAgIAl1bnNpZ25lZCBsb25nIGZs
YWdzOw0KPj4gLQl1aW50MzJfdCBzZXE7DQo+PiArCXVpbnQzMl90IHNlcSwgcmVnX3ZhbF9vZmZz
ID0gMCwgdmFsdWUgPSAwOw0KPj4gICAgCXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+
Z2Z4LmtpcTsNCj4+ICAgIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAma2lxLT5yaW5nOw0K
Pj4gICAgDQo+PiAgICAJQlVHX09OKCFyaW5nLT5mdW5jcy0+ZW1pdF9ycmVnKTsNCj4+ICAgIA0K
Pj4gICAgCXNwaW5fbG9ja19pcnFzYXZlKCZraXEtPnJpbmdfbG9jaywgZmxhZ3MpOw0KPj4gKwlp
ZiAoYW1kZ3B1X2RldmljZV93Yl9nZXQoYWRldiwgJnJlZ192YWxfb2ZmcykpIHsNCj4+ICsJCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7DQo+PiArCQlwcl9l
cnIoImNyaXRpY2FsIGJ1ZyEgdG9vIG1vcmUga2lxIHJlYWRlcnNcbiIpOw0KPiBUeXBvIGhlcmUs
IHRoaXMgc2hvdWxkIHByb2JhYmx5IHJlYWTCoCAidG9vIG1hbnkga2lxIHJlYWRlcnMiLg0KPg0K
PiBCdXQgSSBkb24ndCB0aGluayB3ZSBuZWVkIHRoZSBlcnJvciBtZXNzYWdlIGhlcmUgYW55d2F5
LCB0aGUgZmFpbGVkX2tpcV9yZWFkIGxhYmVsIGFsc28gcHJpbnRzIGFuIGVycm9yLg0KPg0KPiBX
aXRoIHRoYXQgZml4ZWQgdGhlIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Lg0KPg0KPiBUaGFua3MsDQo+IENocmlzdGlhbi4N
Cj4NCj4+ICsJCWdvdG8gZmFpbGVkX2tpcV9yZWFkOw0KPj4gKwl9DQo+PiAgICAJYW1kZ3B1X3Jp
bmdfYWxsb2MocmluZywgMzIpOw0KPj4gLQlhbWRncHVfcmluZ19lbWl0X3JyZWcocmluZywgcmVn
KTsNCj4+ICsJYW1kZ3B1X3JpbmdfZW1pdF9ycmVnKHJpbmcsIHJlZywgcmVnX3ZhbF9vZmZzKTsN
Cj4+ICAgIAlhbWRncHVfZmVuY2VfZW1pdF9wb2xsaW5nKHJpbmcsICZzZXEpOw0KPj4gICAgCWFt
ZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsNCj4+ICAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZr
aXEtPnJpbmdfbG9jaywgZmxhZ3MpOyBAQCAtNzA3LDcgKzcwNywxMCANCj4+IEBAIHVpbnQzMl90
IGFtZGdwdV9raXFfcnJlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVn
KQ0KPj4gICAgCWlmIChjbnQgPiBNQVhfS0lRX1JFR19UUlkpDQo+PiAgICAJCWdvdG8gZmFpbGVk
X2tpcV9yZWFkOw0KPj4gICAgDQo+PiAtCXJldHVybiBhZGV2LT53Yi53YltraXEtPnJlZ192YWxf
b2Zmc107DQo+PiArCW1iKCk7DQo+PiArCXZhbHVlID0gYWRldi0+d2Iud2JbcmVnX3ZhbF9vZmZz
XTsNCj4+ICsJYW1kZ3B1X2RldmljZV93Yl9mcmVlKGFkZXYsIHJlZ192YWxfb2Zmcyk7DQo+PiAr
CXJldHVybiB2YWx1ZTsNCj4+ICAgIA0KPj4gICAgZmFpbGVkX2tpcV9yZWFkOg0KPj4gICAgCXBy
X2VycigiZmFpbGVkIHRvIHJlYWQgcmVnOiV4XG4iLCByZWcpOyBkaWZmIC0tZ2l0IA0KPj4gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgNCj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oDQo+PiBpbmRleCA2MzQ3NDY4MjkwMjQuLmVlNjk4
ZjAyNDZkOCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZnguaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5o
DQo+PiBAQCAtMTAzLDcgKzEwMyw2IEBAIHN0cnVjdCBhbWRncHVfa2lxIHsNCj4+ICAgIAlzdHJ1
Y3QgYW1kZ3B1X3JpbmcJcmluZzsNCj4+ICAgIAlzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMJaXJxOw0K
Pj4gICAgCWNvbnN0IHN0cnVjdCBraXFfcG00X2Z1bmNzICpwbWY7DQo+PiAtCXVpbnQzMl90CQkJ
cmVnX3ZhbF9vZmZzOw0KPj4gICAgfTsNCj4+ICAgIA0KPj4gICAgLyoNCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oDQo+PiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgNCj4+IGluZGV4IGY2MTY2NGVlNDk0MC4u
MTM3ZDNkMmI0NmU4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3JpbmcuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3JpbmcuaA0KPj4gQEAgLTE4MSw3ICsxODEsOCBAQCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3Mg
ew0KPj4gICAgCXZvaWQgKCplbmRfdXNlKShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpOw0KPj4g
ICAgCXZvaWQgKCplbWl0X3N3aXRjaF9idWZmZXIpIChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcp
Ow0KPj4gICAgCXZvaWQgKCplbWl0X2NudHhjbnRsKSAoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LCB1aW50MzJfdCBmbGFncyk7DQo+PiAtCXZvaWQgKCplbWl0X3JyZWcpKHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZywgdWludDMyX3QgcmVnKTsNCj4+ICsJdm9pZCAoKmVtaXRfcnJlZykoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCByZWcsDQo+PiArCQkJICB1aW50MzJfdCByZWdf
dmFsX29mZnMpOw0KPj4gICAgCXZvaWQgKCplbWl0X3dyZWcpKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2YWwpOw0KPj4gICAgCXZvaWQgKCplbWl0X3Jl
Z193YWl0KShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZywNCj4+ICAgIAkJ
CSAgICAgIHVpbnQzMl90IHZhbCwgdWludDMyX3QgbWFzayk7IEBAIC0yNjUsNyArMjY2LDcgQEAg
c3RydWN0IA0KPj4gYW1kZ3B1X3Jpbmcgew0KPj4gICAgI2RlZmluZSBhbWRncHVfcmluZ19lbWl0
X2hkcF9mbHVzaChyKSAociktPmZ1bmNzLT5lbWl0X2hkcF9mbHVzaCgocikpDQo+PiAgICAjZGVm
aW5lIGFtZGdwdV9yaW5nX2VtaXRfc3dpdGNoX2J1ZmZlcihyKSAociktPmZ1bmNzLT5lbWl0X3N3
aXRjaF9idWZmZXIoKHIpKQ0KPj4gICAgI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X2NudHhjbnRs
KHIsIGQpIA0KPj4gKHIpLT5mdW5jcy0+ZW1pdF9jbnR4Y250bCgociksIChkKSkgLSNkZWZpbmUg
YW1kZ3B1X3JpbmdfZW1pdF9ycmVnKHIsDQo+PiBkKSAociktPmZ1bmNzLT5lbWl0X3JyZWcoKHIp
LCAoZCkpDQo+PiArI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X3JyZWcociwgZCwgbykgKHIpLT5m
dW5jcy0+ZW1pdF9ycmVnKChyKSwgDQo+PiArKGQpLCAobykpDQo+PiAgICAjZGVmaW5lIGFtZGdw
dV9yaW5nX2VtaXRfd3JlZyhyLCBkLCB2KSAociktPmZ1bmNzLT5lbWl0X3dyZWcoKHIpLCAoZCks
ICh2KSkNCj4+ICAgICNkZWZpbmUgYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd2FpdChyLCBkLCB2LCBt
KSAociktPmZ1bmNzLT5lbWl0X3JlZ193YWl0KChyKSwgKGQpLCAodiksIChtKSkNCj4+ICAgICNk
ZWZpbmUgYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXQociwgZDAsIGQxLCB2LCBt
KSANCj4+IChyKS0+ZnVuY3MtPmVtaXRfcmVnX3dyaXRlX3JlZ193YWl0KChyKSwgKGQwKSwgKGQx
KSwgKHYpLCAobSkpIGRpZmYgDQo+PiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92MTBfMC5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
DQo+PiBpbmRleCAwYTAzZTJhZDVkOTUuLjBhM2QzYmM5ZDQ0MSAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KPj4gQEAgLTc1OTQsNyArNzU5NCw4IEBAIHN0
YXRpYyB2b2lkIGdmeF92MTBfMF9yaW5nX2VtaXRfZnJhbWVfY250bChzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIGJvb2wgc3RhcnQsDQo+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgdiB8
IEZSQU1FX0NNRChzdGFydCA/IDAgOiAxKSk7DQo+PiAgICB9DQo+PiAgICANCj4+IC1zdGF0aWMg
dm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X3JyZWcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCAN
Cj4+IHVpbnQzMl90IHJlZykNCj4+ICtzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X3Jy
ZWcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCByZWcsDQo+PiArCQkJCSAgICAg
dWludDMyX3QgcmVnX3ZhbF9vZmZzKQ0KPj4gICAgew0KPj4gICAgCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gcmluZy0+YWRldjsNCj4+ICAgIAlzdHJ1Y3QgYW1kZ3B1X2tpcSAqa2lxID0g
JmFkZXYtPmdmeC5raXE7IEBAIC03NjA2LDkgKzc2MDcsOSBAQCANCj4+IHN0YXRpYyB2b2lkIGdm
eF92MTBfMF9yaW5nX2VtaXRfcnJlZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90
IHJlZykNCj4+ICAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCByZWcpOw0KPj4gICAgCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KPj4gICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIGxv
d2VyXzMyX2JpdHMoYWRldi0+d2IuZ3B1X2FkZHIgKw0KPj4gLQkJCQlraXEtPnJlZ192YWxfb2Zm
cyAqIDQpKTsNCj4+ICsJCQkJcmVnX3ZhbF9vZmZzICogNCkpOw0KPj4gICAgCWFtZGdwdV9yaW5n
X3dyaXRlKHJpbmcsIHVwcGVyXzMyX2JpdHMoYWRldi0+d2IuZ3B1X2FkZHIgKw0KPj4gLQkJCQlr
aXEtPnJlZ192YWxfb2ZmcyAqIDQpKTsNCj4+ICsJCQkJcmVnX3ZhbF9vZmZzICogNCkpOw0KPj4g
ICAgfQ0KPj4gICAgDQo+PiAgICBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X3dyZWco
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCANCj4+IHVpbnQzMl90IHJlZywgZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMNCj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KPj4gaW5kZXggZmM2YzJmMmJjNzZjLi5jY2ZhNjVj
M2NiNWEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhf
MC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQo+PiBA
QCAtNjM4Myw3ICs2MzgzLDggQEAgc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfcmluZ19lbWl0X3BhdGNo
X2NvbmRfZXhlYyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmUNCj4+ICAgIAkJcmlu
Zy0+cmluZ1tvZmZzZXRdID0gKHJpbmctPnJpbmdfc2l6ZSA+PiAyKSAtIG9mZnNldCArIGN1cjsN
Cj4+ICAgIH0NCj4+ICAgIA0KPj4gLXN0YXRpYyB2b2lkIGdmeF92OF8wX3JpbmdfZW1pdF9ycmVn
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgDQo+PiB1aW50MzJfdCByZWcpDQo+PiArc3RhdGlj
IHZvaWQgZ2Z4X3Y4XzBfcmluZ19lbWl0X3JyZWcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1
aW50MzJfdCByZWcsDQo+PiArCQkJCSAgICB1aW50MzJfdCByZWdfdmFsX29mZnMpDQo+PiAgICB7
DQo+PiAgICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Ow0KPj4gICAg
CXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsgQEAgLTYzOTUsOSArNjM5
Niw5IEBAIA0KPj4gc3RhdGljIHZvaWQgZ2Z4X3Y4XzBfcmluZ19lbWl0X3JyZWcoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCByZWcpDQo+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgcmVnKTsNCj4+ICAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4+ICAgIAlh
bWRncHVfcmluZ193cml0ZShyaW5nLCBsb3dlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsN
Cj4+IC0JCQkJa2lxLT5yZWdfdmFsX29mZnMgKiA0KSk7DQo+PiArCQkJCXJlZ192YWxfb2ZmcyAq
IDQpKTsNCj4+ICAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9iaXRzKGFkZXYt
PndiLmdwdV9hZGRyICsNCj4+IC0JCQkJa2lxLT5yZWdfdmFsX29mZnMgKiA0KSk7DQo+PiArCQkJ
CXJlZ192YWxfb2ZmcyAqIDQpKTsNCj4+ICAgIH0NCj4+ICAgIA0KPj4gICAgc3RhdGljIHZvaWQg
Z2Z4X3Y4XzBfcmluZ19lbWl0X3dyZWcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCANCj4+IHVp
bnQzMl90IHJlZywgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPj4gaW5k
ZXggODRmY2Y4NDIzMTZkLi4wYjcwNmY5MDhkOWEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jDQo+PiBAQCAtNDA0MywxMyArNDA0MywxOSBAQCBzdGF0aWMgdWlu
dDY0X3QgZ2Z4X3Y5XzBfa2lxX3JlYWRfY2xvY2soc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQo+PiAgICB7DQo+PiAgICAJc2lnbmVkIGxvbmcgciwgY250ID0gMDsNCj4+ICAgIAl1bnNpZ25l
ZCBsb25nIGZsYWdzOw0KPj4gLQl1aW50MzJfdCBzZXE7DQo+PiArCXVpbnQzMl90IHNlcSwgcmVn
X3ZhbF9vZmZzID0gMDsNCj4+ICsJdWludDY0X3QgdmFsdWUgPSAwOw0KPj4gICAgCXN0cnVjdCBh
bWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsNCj4+ICAgIAlzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcgPSAma2lxLT5yaW5nOw0KPj4gICAgDQo+PiAgICAJQlVHX09OKCFyaW5nLT5mdW5j
cy0+ZW1pdF9ycmVnKTsNCj4+ICAgIA0KPj4gICAgCXNwaW5fbG9ja19pcnFzYXZlKCZraXEtPnJp
bmdfbG9jaywgZmxhZ3MpOw0KPj4gKwlpZiAoYW1kZ3B1X2RldmljZV93Yl9nZXQoYWRldiwgJnJl
Z192YWxfb2ZmcykpIHsNCj4+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmtpcS0+cmluZ19s
b2NrLCBmbGFncyk7DQo+PiArCQlwcl9lcnIoImNyaXRpY2FsIGJ1ZyEgdG9vIG1vcmUga2lxIHJl
YWRlcnNcbiIpOw0KPj4gKwkJZ290byBmYWlsZWRfa2lxX3JlYWQ7DQo+PiArCX0NCj4+ICAgIAlh
bWRncHVfcmluZ19hbGxvYyhyaW5nLCAzMik7DQo+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgUEFDS0VUMyhQQUNLRVQzX0NPUFlfREFUQSwgNCkpOw0KPj4gICAgCWFtZGdwdV9yaW5nX3dy
aXRlKHJpbmcsIDkgfAkvKiBzcmM6IHJlZ2lzdGVyKi8NCj4+IEBAIC00MDU5LDkgKzQwNjUsOSBA
QCBzdGF0aWMgdWludDY0X3QgZ2Z4X3Y5XzBfa2lxX3JlYWRfY2xvY2soc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQo+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQo+PiAgICAJ
YW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQo+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgbG93ZXJfMzJfYml0cyhhZGV2LT53Yi5ncHVfYWRkciArDQo+PiAtCQkJCWtpcS0+cmVnX3Zh
bF9vZmZzICogNCkpOw0KPj4gKwkJCQlyZWdfdmFsX29mZnMgKiA0KSk7DQo+PiAgICAJYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgdXBwZXJfMzJfYml0cyhhZGV2LT53Yi5ncHVfYWRkciArDQo+PiAt
CQkJCWtpcS0+cmVnX3ZhbF9vZmZzICogNCkpOw0KPj4gKwkJCQlyZWdfdmFsX29mZnMgKiA0KSk7
DQo+PiAgICAJYW1kZ3B1X2ZlbmNlX2VtaXRfcG9sbGluZyhyaW5nLCAmc2VxKTsNCj4+ICAgIAlh
bWRncHVfcmluZ19jb21taXQocmluZyk7DQo+PiAgICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
a2lxLT5yaW5nX2xvY2ssIGZsYWdzKTsgQEAgLTQwODgsOA0KPj4gKzQwOTQsMTEgQEAgc3RhdGlj
IHVpbnQ2NF90IGdmeF92OV8wX2tpcV9yZWFkX2Nsb2NrKHN0cnVjdCANCj4+ICthbWRncHVfZGV2
aWNlICphZGV2KQ0KPj4gICAgCWlmIChjbnQgPiBNQVhfS0lRX1JFR19UUlkpDQo+PiAgICAJCWdv
dG8gZmFpbGVkX2tpcV9yZWFkOw0KPj4gICAgDQo+PiAtCXJldHVybiAodWludDY0X3QpYWRldi0+
d2Iud2Jba2lxLT5yZWdfdmFsX29mZnNdIHwNCj4+IC0JCSh1aW50NjRfdClhZGV2LT53Yi53Yltr
aXEtPnJlZ192YWxfb2ZmcyArIDEgXSA8PCAzMlVMTDsNCj4+ICsJbWIoKTsNCj4+ICsJdmFsdWUg
PSAodWludDY0X3QpYWRldi0+d2Iud2JbcmVnX3ZhbF9vZmZzXSB8DQo+PiArCQkodWludDY0X3Qp
YWRldi0+d2Iud2JbcmVnX3ZhbF9vZmZzICsgMSBdIDw8IDMyVUxMOw0KPj4gKwlhbWRncHVfZGV2
aWNlX3diX2ZyZWUoYWRldiwgcmVnX3ZhbF9vZmZzKTsNCj4+ICsJcmV0dXJuIHZhbHVlOw0KPj4g
ICAgDQo+PiAgICBmYWlsZWRfa2lxX3JlYWQ6DQo+PiAgICAJcHJfZXJyKCJmYWlsZWQgdG8gcmVh
ZCBncHUgY2xvY2tcbiIpOyBAQCAtNTQ4MiwxMCArNTQ5MSwxMCBAQCANCj4+IHN0YXRpYyB2b2lk
IGdmeF92OV8wX3JpbmdfZW1pdF9wYXRjaF9jb25kX2V4ZWMoc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nLCB1bnNpZ25lDQo+PiAgICAJCXJpbmctPnJpbmdbb2Zmc2V0XSA9IChyaW5nLT5yaW5nX3Np
emU+PjIpIC0gb2Zmc2V0ICsgY3VyOw0KPj4gICAgfQ0KPj4gICAgDQo+PiAtc3RhdGljIHZvaWQg
Z2Z4X3Y5XzBfcmluZ19lbWl0X3JyZWcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCANCj4+IHVp
bnQzMl90IHJlZykNCj4+ICtzdGF0aWMgdm9pZCBnZnhfdjlfMF9yaW5nX2VtaXRfcnJlZyhzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZywNCj4+ICsJCQkJICAgIHVpbnQzMl90
IHJlZ192YWxfb2ZmcykNCj4+ICAgIHsNCj4+ICAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IHJpbmctPmFkZXY7DQo+PiAtCXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+Z2Z4
LmtpcTsNCj4+ICAgIA0KPj4gICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFD
S0VUM19DT1BZX0RBVEEsIDQpKTsNCj4+ICAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwIHwJ
Lyogc3JjOiByZWdpc3RlciovDQo+PiBAQCAtNTQ5NCw5ICs1NTAzLDkgQEAgc3RhdGljIHZvaWQg
Z2Z4X3Y5XzBfcmluZ19lbWl0X3JyZWcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJf
dCByZWcpDQo+PiAgICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgcmVnKTsNCj4+ICAgIAlhbWRn
cHVfcmluZ193cml0ZShyaW5nLCAwKTsNCj4+ICAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBs
b3dlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4+IC0JCQkJa2lxLT5yZWdfdmFsX29m
ZnMgKiA0KSk7DQo+PiArCQkJCXJlZ192YWxfb2ZmcyAqIDQpKTsNCj4+ICAgIAlhbWRncHVfcmlu
Z193cml0ZShyaW5nLCB1cHBlcl8zMl9iaXRzKGFkZXYtPndiLmdwdV9hZGRyICsNCj4+IC0JCQkJ
a2lxLT5yZWdfdmFsX29mZnMgKiA0KSk7DQo+PiArCQkJCXJlZ192YWxfb2ZmcyAqIDQpKTsNCj4+
ICAgIH0NCj4+ICAgIA0KPj4gICAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfcmluZ19lbWl0X3dyZWco
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCANCj4+IHVpbnQzMl90IHJlZywNCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9uYW0xMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdA0K
PiBzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2Rh
dGE9MDIlN0MwMSU3Q1NoDQo+IGFveXVuLkxpdSU0MGFtZC5jb20lN0M5ZDk2MGQ1YmUzZjE0MWY0
NGYwNjA4ZDdlNmJhODk2MiU3QzNkZDg5NjFmZTQ4ODQNCj4gZTYwOGUxMWE4MmQ5OTRlMTgzZCU3
QzAlN0MwJTdDNjM3MjMxNTYxMTc2MTcxODE5JmFtcDtzZGF0YT1PbkR0eG4lMkZUUA0KPiBubXpp
Z1ZLSkVBRjM3ZlFkVWNmRE1XQjF4Y2JyUWJEY0ljJTNEJmFtcDtyZXNlcnZlZD0wDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5n
IGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL25hbTExLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVl
ZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdD
MDElN0N5aW50aWFuLnRhbyU0MGFtZC5jb20lN0MyODYyN2E5YzM2MjI0NWMxOTY5ZDA4ZDdlNmQz
ZDU2OCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyMzE2
NzAzNDY4NzIzMDQmYW1wO3NkYXRhPW8wJTJGZEd0MXNxaXIyZVZHVGYxSmRhbURTTnZKbmJNWTVX
dnl4V2ExbVVVVSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
