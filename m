Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3C85058
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 17:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCD46E72E;
	Wed,  7 Aug 2019 15:53:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A90F6E72E
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 15:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPj9Danzx23GgfYeRfGnK88ZUAg8CH2yalUX3srb8lTLRXomVPnKJncXCupltrrD1d84nIJJYzg6nDbaChiiQxzxIwpZttCBhOp1eS8m/z50nm9PexvLPPiNoxVye3v94Ssuz7FwPeEBAiHn4lj/StuamVafEJKmV4ce7/iIPVOxITnuwt6eTN5mlhZ0xw1VBj4kxo+hJ/4NusLnm4wiuBKuubMIf8bxt6D+78+OFlzSqQ2mesi7W3SxWkZSMTO9mg2gu/SzBoOoezb8rCeOrinlo4TT6cwXj5zaLPbw28vlsODAg3tCYhXBXhuG1ccipWpRm+Y+pPSoi3BeIQTqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KostX4xjTwf3H4M26TqzKxnnI0/WuZp8InMfZulYBo=;
 b=M+nBVfFIRbrI49tcK20iacZhNCS8NrNw787fxxtZLHlBdX6nfbdwklvLEiO0mfp+1eKRn+EtBlQ7cCRGMgIm7Z3HJSoYZ8/tRLgcj2dfb4UemZaff34M5dzz0N+8aaQ/23D2v5g1TXqqFHi44Nd+nlbfVqFfxz8YnuVMN8JcyDlvMMuoGe/lDQylWzNtL239Ck8kpbQ6OPLCtLLf58/fFX47a8gnwYf1H4nLB7x5MKlaFcqG64esDO5jpRZTGA2AF32DW39EZHyE01fxyxoC8mu2WvnHIgyKwzjQQP5U1IZr1m+tYNh1N74Sz+oeiNy43AAUMo9BJfO8dYLltcsWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0021.namprd12.prod.outlook.com (10.172.77.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Wed, 7 Aug 2019 15:53:24 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::540f:1eae:7e3a:c6b2%5]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 15:53:24 +0000
From: Harry Wentland <hwentlan@amd.com>
To: "Francis, David" <David.Francis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Remove drm_dsc_dc.c
Thread-Topic: [PATCH] drm/amd/display: Remove drm_dsc_dc.c
Thread-Index: AQHVTSyJBj7VOK5e+kGeAXk1kjUd8qbv1iEA
Date: Wed, 7 Aug 2019 15:53:24 +0000
Message-ID: <88c58273-376f-a3ff-419d-de3b4d2de100@amd.com>
References: <20190807142922.3106-1-David.Francis@amd.com>
In-Reply-To: <20190807142922.3106-1-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::26) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbd21bb7-7f33-44d3-04f1-08d71b4f6108
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0021; 
x-ms-traffictypediagnostic: CY4PR1201MB0021:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0021A382B9DE65728CC768978CD40@CY4PR1201MB0021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(189003)(199004)(2501003)(229853002)(6116002)(3846002)(52116002)(6436002)(64126003)(65956001)(14454004)(65806001)(66066001)(8936002)(76176011)(81166006)(478600001)(81156014)(6486002)(53936002)(31686004)(2906002)(25786009)(99286004)(7736002)(5660300002)(11346002)(476003)(31696002)(2616005)(486006)(30864003)(26005)(446003)(305945005)(6246003)(8676002)(6512007)(14444005)(64756008)(66446008)(36756003)(66946007)(66476007)(66556008)(256004)(65826007)(53946003)(58126008)(110136005)(53546011)(71190400001)(316002)(6506007)(386003)(68736007)(71200400001)(102836004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0021;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kZvf11gIAGLFrAwhT98d8Gr7/xoFFOBy9BbbMOdhjYrVDOGpfdpNm3dumQuZ0mq5PxwbJ2gQjstp9AAty61F5V4Wp0eU0xqlBQWx+tB36RDtpUc3x/r/vhKoPk3zgcCJnZ5rPGxL7SvZKUxF5MiMTzbayAD354b6L0tusonXfrLu7K4fNXiEUJEXQ6+MrlaOBRDmMFdZDPW6Kg5DD/nbzvAEVanvloZtLUTrdW1c5uVV57BaVZjJ7d+kPfG40CEDi/I48fLOq5CcrKld225BvQzS7YQB4JYRn1+5WeTPI9KjtELMhO9L0JWjfCqHzkR0owfSSiGC0YINjAQSd9FPol2+en4Bdc930PFjHxS1jthXfd6UDBEJeOcee2JMa7eg4Gyv7T9dP3n/fwBX29SMII2RfoDdjuVvEIhoW/jlKK4=
Content-ID: <6FBBC2B799114047B5C442D9B153ABFA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd21bb7-7f33-44d3-04f1-08d71b4f6108
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 15:53:24.3894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KostX4xjTwf3H4M26TqzKxnnI0/WuZp8InMfZulYBo=;
 b=IiHMCf/gh/kVP8LkzyxXkK/4TGGKwfKcxiWdzspLjQvCDOL8k40VfHJ9tEg7e/ieutv6pmMe0qHJMB8zu//mh/hrjsGO8O4dzsoPdzRqYNfUkASdAkOptC1Y8jrUQLUZO+sNr1oJt5bDU2B+fdaf0s8JC/5tovNDk4ihJeHa/Og=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

T24gMjAxOS0wOC0wNyAxMDoyOSBhLm0uLCBEYXZpZCBGcmFuY2lzIHdyb3RlOg0KPiBUaGlzIGZp
bGUgd2FzIGFjY2lkZW50YWxseSBhZGRlZCB0byB0aGUgZHJpdmVyIGR1cmluZw0KPiBOYXZpIHBy
b21vdGlvbg0KPiANCj4gTm90aGluZyBpbmNsdWRlcyBpdC4gTm8gbWFrZWZpbGUgYXR0ZW1wdHMg
dG8gY29tcGlsZSBpdCwgYW5kDQo+IGl0IHdvdWxkIGZhaWwgY29tcGlsYXRpb24gaWYgdGhleSB0
cmllZA0KPiANCj4gUmVtb3ZlIGl0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lz
IDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8
aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFycnkNCg0KPiAtLS0NCj4gIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RzYy9kcm1fZHNjX2RjLmMgICB8IDQ1MyAtLS0tLS0tLS0tLS0tLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NTMgZGVsZXRpb25zKC0pDQo+ICBkZWxldGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kcm1fZHNjX2RjLmMNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RybV9k
c2NfZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZHJtX2RzY19kYy5j
DQo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCBmZDFmYjE2NTM0NzkuLjAwMDAw
MDAwMDAwMA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RybV9k
c2NfZGMuYw0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xLDQ1MyArMCwwIEBADQo+IC0vLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+IC0vKg0KPiAtICogQ29weXJpZ2h0IMKpIDIwMTgg
SW50ZWwgQ29ycA0KPiAtICoNCj4gLSAqIEF1dGhvcjoNCj4gLSAqIE1hbmFzaSBOYXZhcmUgPG1h
bmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+DQo+IC0gKi8NCj4gLQ0KPiAtLyogREMgdmVyc2lvbnMg
b2YgbGludXggaW5jbHVkZXMgKi8NCj4gLSNpbmNsdWRlIDxpbmNsdWRlL2RybV9kc2NfZGMuaD4N
Cj4gLQ0KPiAtI2RlZmluZSBFWFBPUlRfU1lNQk9MKHN5bWJvbCkJLyogbm90aGluZyAqLw0KPiAt
I2RlZmluZSBCVUlMRF9CVUdfT04oY29uZCkJLyogbm90aGluZyAqLw0KPiAtI2RlZmluZSBESVZf
Uk9VTkRfVVAoYSwgYikJKCgoYikgKyAoYSkgLSAxKSAvIChiKSkNCj4gLSNkZWZpbmUgRVJBTkdF
CQkJLTENCj4gLSNkZWZpbmUgRFJNX0RFQlVHX0tNUyhtc2cpCS8qIG5vdGhpbmcgKi8NCj4gLSNk
ZWZpbmUgY3B1X3RvX2JlMTYoX194KSBsaXR0bGVfdG9fYmlnKF9feCkNCj4gLSNkZWZpbmUgTUFY
KHgsIHkpCQkoKHgpID4gKHkpID8gKHgpIDogKHkpKQ0KPiAtDQo+IC1zdGF0aWMgdW5zaWduZWQg
c2hvcnQgbGl0dGxlX3RvX2JpZyhpbnQgZGF0YSkNCj4gLXsNCj4gLQkvKiBTd2FwIGxvd2VyIGFu
ZCB1cHBlciBieXRlLiBETUNVIHVzZXMgYmlnIGVuZGlhbiBmb3JtYXQuICovDQo+IC0JcmV0dXJu
ICgweGZmICYgKGRhdGEgPj4gOCkpICsgKChkYXRhICYgMHhmZikgPDwgOCk7DQo+IC19DQo+IC0N
Cj4gLS8qDQo+IC0gKiBFdmVyeXRoaW5nIGJlbG93IHRoaXMgY29tbWVudCB3YXMgY29waWVkIGRp
cmVjdGx5IGZyb20gZHJtX2RzYy5jLg0KPiAtICogT25seSB0aGUgZnVuY3Rpb25zIG5lZWRlZCBp
biBEQyBhcmUgaW5jbHVkZWQuDQo+IC0gKiBQbGVhc2Uga2VlcCB0aGlzIGZpbGUgc3luY2VkIHdp
dGggdXBzdHJlYW0uDQo+IC0gKi8NCj4gLQ0KPiAtLyoqDQo+IC0gKiBET0M6IGRzYyBoZWxwZXJz
DQo+IC0gKg0KPiAtICogVGhlc2UgZnVuY3Rpb25zIGNvbnRhaW4gc29tZSBjb21tb24gbG9naWMg
YW5kIGhlbHBlcnMgdG8gZGVhbCB3aXRoIFZFU0ENCj4gLSAqIERpc3BsYXkgU3RyZWFtIENvbXBy
ZXNzaW9uIHN0YW5kYXJkIHJlcXVpcmVkIGZvciBEU0Mgb24gRGlzcGxheSBQb3J0L2VEUCBvcg0K
PiAtICogTUlQSSBkaXNwbGF5IGludGVyZmFjZXMuDQo+IC0gKi8NCj4gLQ0KPiAtLyoqDQo+IC0g
KiBkcm1fZHNjX3Bwc19wYXlsb2FkX3BhY2soKSAtIFBvcHVsYXRlcyB0aGUgRFNDIFBQUw0KPiAt
ICoNCj4gLSAqIEBwcHNfcGF5bG9hZDoNCj4gLSAqIEJpdHdpc2Ugc3RydWN0IGZvciBEU0MgUGlj
dHVyZSBQYXJhbWV0ZXIgU2V0LiBUaGlzIGlzIGRlZmluZWQNCj4gLSAqIGJ5ICZzdHJ1Y3QgZHJt
X2RzY19waWN0dXJlX3BhcmFtZXRlcl9zZXQNCj4gLSAqIEBkc2NfY2ZnOg0KPiAtICogRFNDIENv
bmZpZ3VyYXRpb24gZGF0YSBmaWxsZWQgYnkgZHJpdmVyIGFzIGRlZmluZWQgYnkNCj4gLSAqICZz
dHJ1Y3QgZHJtX2RzY19jb25maWcNCj4gLSAqDQo+IC0gKiBEU0Mgc291cmNlIGRldmljZSBzZW5k
cyBhIHBpY3R1cmUgcGFyYW1ldGVyIHNldCAoUFBTKSBjb250YWluaW5nIHRoZQ0KPiAtICogaW5m
b3JtYXRpb24gcmVxdWlyZWQgYnkgdGhlIHNpbmsgdG8gZGVjb2RlIHRoZSBjb21wcmVzc2VkIGZy
YW1lLiBEcml2ZXINCj4gLSAqIHBvcHVsYXRlcyB0aGUgRFNDIFBQUyBzdHJ1Y3QgdXNpbmcgdGhl
IERTQyBjb25maWd1cmF0aW9uIHBhcmFtZXRlcnMgaW4NCj4gLSAqIHRoZSBvcmRlciBleHBlY3Rl
ZCBieSB0aGUgRFNDIERpc3BsYXkgU2luayBkZXZpY2UuIEZvciB0aGUgRFNDLCB0aGUgc2luaw0K
PiAtICogZGV2aWNlIGV4cGVjdHMgdGhlIFBQUyBwYXlsb2FkIGluIGJpZyBlbmRpYW4gZm9ybWF0
IGZvciBmaWVsZHMNCj4gLSAqIHRoYXQgc3BhbiBtb3JlIHRoYW4gMSBieXRlLg0KPiAtICovDQo+
IC12b2lkIGRybV9kc2NfcHBzX3BheWxvYWRfcGFjayhzdHJ1Y3QgZHJtX2RzY19waWN0dXJlX3Bh
cmFtZXRlcl9zZXQgKnBwc19wYXlsb2FkLA0KPiAtCQkJCWNvbnN0IHN0cnVjdCBkcm1fZHNjX2Nv
bmZpZyAqZHNjX2NmZykNCj4gLXsNCj4gLQlpbnQgaTsNCj4gLQ0KPiAtCS8qIFByb3RlY3QgYWdh
aW5zdCBzb21lb25lIGFjY2lkZW50bHkgY2hhbmdpbmcgc3RydWN0IHNpemUgKi8NCj4gLQlCVUlM
RF9CVUdfT04oc2l6ZW9mKCpwcHNfcGF5bG9hZCkgIT0NCj4gLQkJICAgICBEUF9TRFBfUFBTX0hF
QURFUl9QQVlMT0FEX0JZVEVTX01JTlVTXzEgKyAxKTsNCj4gLQ0KPiAtCW1lbXNldChwcHNfcGF5
bG9hZCwgMCwgc2l6ZW9mKCpwcHNfcGF5bG9hZCkpOw0KPiAtDQo+IC0JLyogUFBTIDAgKi8NCj4g
LQlwcHNfcGF5bG9hZC0+ZHNjX3ZlcnNpb24gPQ0KPiAtCQlkc2NfY2ZnLT5kc2NfdmVyc2lvbl9t
aW5vciB8DQo+IC0JCWRzY19jZmctPmRzY192ZXJzaW9uX21ham9yIDw8IERTQ19QUFNfVkVSU0lP
Tl9NQUpPUl9TSElGVDsNCj4gLQ0KPiAtCS8qIFBQUyAxLCAyIGlzIDAgKi8NCj4gLQ0KPiAtCS8q
IFBQUyAzICovDQo+IC0JcHBzX3BheWxvYWQtPnBwc18zID0NCj4gLQkJZHNjX2NmZy0+bGluZV9i
dWZfZGVwdGggfA0KPiAtCQlkc2NfY2ZnLT5iaXRzX3Blcl9jb21wb25lbnQgPDwgRFNDX1BQU19C
UENfU0hJRlQ7DQo+IC0NCj4gLQkvKiBQUFMgNCAqLw0KPiAtCXBwc19wYXlsb2FkLT5wcHNfNCA9
DQo+IC0JCSgoZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwgJiBEU0NfUFBTX0JQUF9ISUdIX01BU0sp
ID4+DQo+IC0JCSBEU0NfUFBTX01TQl9TSElGVCkgfA0KPiAtCQlkc2NfY2ZnLT52YnJfZW5hYmxl
IDw8IERTQ19QUFNfVkJSX0VOX1NISUZUIHwNCj4gLQkJZHNjX2NmZy0+c2ltcGxlXzQyMiA8PCBE
U0NfUFBTX1NJTVBMRTQyMl9TSElGVCB8DQo+IC0JCWRzY19jZmctPmNvbnZlcnRfcmdiIDw8IERT
Q19QUFNfQ09OVkVSVF9SR0JfU0hJRlQgfA0KPiAtCQlkc2NfY2ZnLT5ibG9ja19wcmVkX2VuYWJs
ZSA8PCBEU0NfUFBTX0JMT0NLX1BSRURfRU5fU0hJRlQ7DQo+IC0NCj4gLQkvKiBQUFMgNSAqLw0K
PiAtCXBwc19wYXlsb2FkLT5iaXRzX3Blcl9waXhlbF9sb3cgPQ0KPiAtCQkoZHNjX2NmZy0+Yml0
c19wZXJfcGl4ZWwgJiBEU0NfUFBTX0xTQl9NQVNLKTsNCj4gLQ0KPiAtCS8qDQo+IC0JICogVGhl
IERTQyBwYW5lbCBleHBlY3RzIHRoZSBQUFMgcGFja2V0IHRvIGhhdmUgYmlnIGVuZGlhbiBmb3Jt
YXQNCj4gLQkgKiBmb3IgZGF0YSBzcGFubmluZyAyIGJ5dGVzLiBVc2UgYSBtYWNybyBjcHVfdG9f
YmUxNigpIHRvIGNvbnZlcnQNCj4gLQkgKiB0byBiaWcgZW5kaWFuIGZvcm1hdC4gSWYgZm9ybWF0
IGlzIGxpdHRsZSBlbmRpYW4sIGl0IHdpbGwgc3dhcA0KPiAtCSAqIGJ5dGVzIHRvIGNvbnZlcnQg
dG8gQmlnIGVuZGlhbiBlbHNlIGtlZXAgaXQgdW5jaGFuZ2VkLg0KPiAtCSAqLw0KPiAtDQo+IC0J
LyogUFBTIDYsIDcgKi8NCj4gLQlwcHNfcGF5bG9hZC0+cGljX2hlaWdodCA9IGNwdV90b19iZTE2
KGRzY19jZmctPnBpY19oZWlnaHQpOw0KPiAtDQo+IC0JLyogUFBTIDgsIDkgKi8NCj4gLQlwcHNf
cGF5bG9hZC0+cGljX3dpZHRoID0gY3B1X3RvX2JlMTYoZHNjX2NmZy0+cGljX3dpZHRoKTsNCj4g
LQ0KPiAtCS8qIFBQUyAxMCwgMTEgKi8NCj4gLQlwcHNfcGF5bG9hZC0+c2xpY2VfaGVpZ2h0ID0g
Y3B1X3RvX2JlMTYoZHNjX2NmZy0+c2xpY2VfaGVpZ2h0KTsNCj4gLQ0KPiAtCS8qIFBQUyAxMiwg
MTMgKi8NCj4gLQlwcHNfcGF5bG9hZC0+c2xpY2Vfd2lkdGggPSBjcHVfdG9fYmUxNihkc2NfY2Zn
LT5zbGljZV93aWR0aCk7DQo+IC0NCj4gLQkvKiBQUFMgMTQsIDE1ICovDQo+IC0JcHBzX3BheWxv
YWQtPmNodW5rX3NpemUgPSBjcHVfdG9fYmUxNihkc2NfY2ZnLT5zbGljZV9jaHVua19zaXplKTsN
Cj4gLQ0KPiAtCS8qIFBQUyAxNiAqLw0KPiAtCXBwc19wYXlsb2FkLT5pbml0aWFsX3htaXRfZGVs
YXlfaGlnaCA9DQo+IC0JCSgoZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5ICYNCj4gLQkJICBE
U0NfUFBTX0lOSVRfWE1JVF9ERUxBWV9ISUdIX01BU0spID4+DQo+IC0JCSBEU0NfUFBTX01TQl9T
SElGVCk7DQo+IC0NCj4gLQkvKiBQUFMgMTcgKi8NCj4gLQlwcHNfcGF5bG9hZC0+aW5pdGlhbF94
bWl0X2RlbGF5X2xvdyA9DQo+IC0JCShkc2NfY2ZnLT5pbml0aWFsX3htaXRfZGVsYXkgJiBEU0Nf
UFBTX0xTQl9NQVNLKTsNCj4gLQ0KPiAtCS8qIFBQUyAxOCwgMTkgKi8NCj4gLQlwcHNfcGF5bG9h
ZC0+aW5pdGlhbF9kZWNfZGVsYXkgPQ0KPiAtCQljcHVfdG9fYmUxNihkc2NfY2ZnLT5pbml0aWFs
X2RlY19kZWxheSk7DQo+IC0NCj4gLQkvKiBQUFMgMjAgaXMgMCAqLw0KPiAtDQo+IC0JLyogUFBT
IDIxICovDQo+IC0JcHBzX3BheWxvYWQtPmluaXRpYWxfc2NhbGVfdmFsdWUgPQ0KPiAtCQlkc2Nf
Y2ZnLT5pbml0aWFsX3NjYWxlX3ZhbHVlOw0KPiAtDQo+IC0JLyogUFBTIDIyLCAyMyAqLw0KPiAt
CXBwc19wYXlsb2FkLT5zY2FsZV9pbmNyZW1lbnRfaW50ZXJ2YWwgPQ0KPiAtCQljcHVfdG9fYmUx
Nihkc2NfY2ZnLT5zY2FsZV9pbmNyZW1lbnRfaW50ZXJ2YWwpOw0KPiAtDQo+IC0JLyogUFBTIDI0
ICovDQo+IC0JcHBzX3BheWxvYWQtPnNjYWxlX2RlY3JlbWVudF9pbnRlcnZhbF9oaWdoID0NCj4g
LQkJKChkc2NfY2ZnLT5zY2FsZV9kZWNyZW1lbnRfaW50ZXJ2YWwgJg0KPiAtCQkgIERTQ19QUFNf
U0NBTEVfREVDX0lOVF9ISUdIX01BU0spID4+DQo+IC0JCSBEU0NfUFBTX01TQl9TSElGVCk7DQo+
IC0NCj4gLQkvKiBQUFMgMjUgKi8NCj4gLQlwcHNfcGF5bG9hZC0+c2NhbGVfZGVjcmVtZW50X2lu
dGVydmFsX2xvdyA9DQo+IC0JCShkc2NfY2ZnLT5zY2FsZV9kZWNyZW1lbnRfaW50ZXJ2YWwgJiBE
U0NfUFBTX0xTQl9NQVNLKTsNCj4gLQ0KPiAtCS8qIFBQUyAyNls3OjBdLCBQUFMgMjdbNzo1XSBS
RVNFUlZFRCAqLw0KPiAtDQo+IC0JLyogUFBTIDI3ICovDQo+IC0JcHBzX3BheWxvYWQtPmZpcnN0
X2xpbmVfYnBnX29mZnNldCA9DQo+IC0JCWRzY19jZmctPmZpcnN0X2xpbmVfYnBnX29mZnNldDsN
Cj4gLQ0KPiAtCS8qIFBQUyAyOCwgMjkgKi8NCj4gLQlwcHNfcGF5bG9hZC0+bmZsX2JwZ19vZmZz
ZXQgPQ0KPiAtCQljcHVfdG9fYmUxNihkc2NfY2ZnLT5uZmxfYnBnX29mZnNldCk7DQo+IC0NCj4g
LQkvKiBQUFMgMzAsIDMxICovDQo+IC0JcHBzX3BheWxvYWQtPnNsaWNlX2JwZ19vZmZzZXQgPQ0K
PiAtCQljcHVfdG9fYmUxNihkc2NfY2ZnLT5zbGljZV9icGdfb2Zmc2V0KTsNCj4gLQ0KPiAtCS8q
IFBQUyAzMiwgMzMgKi8NCj4gLQlwcHNfcGF5bG9hZC0+aW5pdGlhbF9vZmZzZXQgPQ0KPiAtCQlj
cHVfdG9fYmUxNihkc2NfY2ZnLT5pbml0aWFsX29mZnNldCk7DQo+IC0NCj4gLQkvKiBQUFMgMzQs
IDM1ICovDQo+IC0JcHBzX3BheWxvYWQtPmZpbmFsX29mZnNldCA9IGNwdV90b19iZTE2KGRzY19j
ZmctPmZpbmFsX29mZnNldCk7DQo+IC0NCj4gLQkvKiBQUFMgMzYgKi8NCj4gLQlwcHNfcGF5bG9h
ZC0+ZmxhdG5lc3NfbWluX3FwID0gZHNjX2NmZy0+ZmxhdG5lc3NfbWluX3FwOw0KPiAtDQo+IC0J
LyogUFBTIDM3ICovDQo+IC0JcHBzX3BheWxvYWQtPmZsYXRuZXNzX21heF9xcCA9IGRzY19jZmct
PmZsYXRuZXNzX21heF9xcDsNCj4gLQ0KPiAtCS8qIFBQUyAzOCwgMzkgKi8NCj4gLQlwcHNfcGF5
bG9hZC0+cmNfbW9kZWxfc2l6ZSA9DQo+IC0JCWNwdV90b19iZTE2KERTQ19SQ19NT0RFTF9TSVpF
X0NPTlNUKTsNCj4gLQ0KPiAtCS8qIFBQUyA0MCAqLw0KPiAtCXBwc19wYXlsb2FkLT5yY19lZGdl
X2ZhY3RvciA9IERTQ19SQ19FREdFX0ZBQ1RPUl9DT05TVDsNCj4gLQ0KPiAtCS8qIFBQUyA0MSAq
Lw0KPiAtCXBwc19wYXlsb2FkLT5yY19xdWFudF9pbmNyX2xpbWl0MCA9DQo+IC0JCWRzY19jZmct
PnJjX3F1YW50X2luY3JfbGltaXQwOw0KPiAtDQo+IC0JLyogUFBTIDQyICovDQo+IC0JcHBzX3Bh
eWxvYWQtPnJjX3F1YW50X2luY3JfbGltaXQxID0NCj4gLQkJZHNjX2NmZy0+cmNfcXVhbnRfaW5j
cl9saW1pdDE7DQo+IC0NCj4gLQkvKiBQUFMgNDMgKi8NCj4gLQlwcHNfcGF5bG9hZC0+cmNfdGd0
X29mZnNldCA9IERTQ19SQ19UR1RfT0ZGU0VUX0xPX0NPTlNUIHwNCj4gLQkJRFNDX1JDX1RHVF9P
RkZTRVRfSElfQ09OU1QgPDwgRFNDX1BQU19SQ19UR1RfT0ZGU0VUX0hJX1NISUZUOw0KPiAtDQo+
IC0JLyogUFBTIDQ0IC0gNTcgKi8NCj4gLQlmb3IgKGkgPSAwOyBpIDwgRFNDX05VTV9CVUZfUkFO
R0VTIC0gMTsgaSsrKQ0KPiAtCQlwcHNfcGF5bG9hZC0+cmNfYnVmX3RocmVzaFtpXSA9DQo+IC0J
CQlkc2NfY2ZnLT5yY19idWZfdGhyZXNoW2ldOw0KPiAtDQo+IC0JLyogUFBTIDU4IC0gODcgKi8N
Cj4gLQkvKg0KPiAtCSAqIEZvciBEU0Mgc2luayBwcm9ncmFtbWluZyB0aGUgUkMgUmFuZ2UgcGFy
YW1ldGVyIGZpZWxkcw0KPiAtCSAqIGFyZSBhcyBmb2xsb3dzOiBNaW5fcXBbMTU6MTFdLCBtYXhf
cXBbMTA6Nl0sIG9mZnNldFs1OjBdDQo+IC0JICovDQo+IC0JZm9yIChpID0gMDsgaSA8IERTQ19O
VU1fQlVGX1JBTkdFUzsgaSsrKSB7DQo+IC0JCXBwc19wYXlsb2FkLT5yY19yYW5nZV9wYXJhbWV0
ZXJzW2ldID0NCj4gLQkJCSgoZHNjX2NmZy0+cmNfcmFuZ2VfcGFyYW1zW2ldLnJhbmdlX21pbl9x
cCA8PA0KPiAtCQkJICBEU0NfUFBTX1JDX1JBTkdFX01JTlFQX1NISUZUKSB8DQo+IC0JCQkgKGRz
Y19jZmctPnJjX3JhbmdlX3BhcmFtc1tpXS5yYW5nZV9tYXhfcXAgPDwNCj4gLQkJCSAgRFNDX1BQ
U19SQ19SQU5HRV9NQVhRUF9TSElGVCkgfA0KPiAtCQkJIChkc2NfY2ZnLT5yY19yYW5nZV9wYXJh
bXNbaV0ucmFuZ2VfYnBnX29mZnNldCkpOw0KPiAtCQlwcHNfcGF5bG9hZC0+cmNfcmFuZ2VfcGFy
YW1ldGVyc1tpXSA9DQo+IC0JCQljcHVfdG9fYmUxNihwcHNfcGF5bG9hZC0+cmNfcmFuZ2VfcGFy
YW1ldGVyc1tpXSk7DQo+IC0JfQ0KPiAtDQo+IC0JLyogUFBTIDg4ICovDQo+IC0JcHBzX3BheWxv
YWQtPm5hdGl2ZV80MjJfNDIwID0gZHNjX2NmZy0+bmF0aXZlXzQyMiB8DQo+IC0JCWRzY19jZmct
Pm5hdGl2ZV80MjAgPDwgRFNDX1BQU19OQVRJVkVfNDIwX1NISUZUOw0KPiAtDQo+IC0JLyogUFBT
IDg5ICovDQo+IC0JcHBzX3BheWxvYWQtPnNlY29uZF9saW5lX2JwZ19vZmZzZXQgPQ0KPiAtCQlk
c2NfY2ZnLT5zZWNvbmRfbGluZV9icGdfb2Zmc2V0Ow0KPiAtDQo+IC0JLyogUFBTIDkwLCA5MSAq
Lw0KPiAtCXBwc19wYXlsb2FkLT5uc2xfYnBnX29mZnNldCA9DQo+IC0JCWNwdV90b19iZTE2KGRz
Y19jZmctPm5zbF9icGdfb2Zmc2V0KTsNCj4gLQ0KPiAtCS8qIFBQUyA5MiwgOTMgKi8NCj4gLQlw
cHNfcGF5bG9hZC0+c2Vjb25kX2xpbmVfb2Zmc2V0X2FkaiA9DQo+IC0JCWNwdV90b19iZTE2KGRz
Y19jZmctPnNlY29uZF9saW5lX29mZnNldF9hZGopOw0KPiAtDQo+IC0JLyogUFBTIDk0IC0gMTI3
IGFyZSBPICovDQo+IC19DQo+IC1FWFBPUlRfU1lNQk9MKGRybV9kc2NfcHBzX3BheWxvYWRfcGFj
ayk7DQo+IC0NCj4gLXN0YXRpYyBpbnQgY29tcHV0ZV9vZmZzZXQoc3RydWN0IGRybV9kc2NfY29u
ZmlnICp2ZHNjX2NmZywgaW50IHBpeGVsc19wZXJfZ3JvdXAsDQo+IC0JCQkJaW50IGdyb3Vwc19w
ZXJfbGluZSwgaW50IGdycGNudCkNCj4gLXsNCj4gLQlpbnQgb2Zmc2V0ID0gMDsNCj4gLQlpbnQg
Z3JwY250X2lkID0gRElWX1JPVU5EX1VQKHZkc2NfY2ZnLT5pbml0aWFsX3htaXRfZGVsYXksIHBp
eGVsc19wZXJfZ3JvdXApOw0KPiAtDQo+IC0JaWYgKGdycGNudCA8PSBncnBjbnRfaWQpDQo+IC0J
CW9mZnNldCA9IERJVl9ST1VORF9VUChncnBjbnQgKiBwaXhlbHNfcGVyX2dyb3VwICogdmRzY19j
ZmctPmJpdHNfcGVyX3BpeGVsLCAxNik7DQo+IC0JZWxzZQ0KPiAtCQlvZmZzZXQgPSBESVZfUk9V
TkRfVVAoZ3JwY250X2lkICogcGl4ZWxzX3Blcl9ncm91cCAqIHZkc2NfY2ZnLT5iaXRzX3Blcl9w
aXhlbCwgMTYpDQo+IC0JCQktICgoKGdycGNudCAtIGdycGNudF9pZCkgKiB2ZHNjX2NmZy0+c2xp
Y2VfYnBnX29mZnNldCkgPj4gMTEpOw0KPiAtDQo+IC0JaWYgKGdycGNudCA8PSBncm91cHNfcGVy
X2xpbmUpDQo+IC0JCW9mZnNldCArPSBncnBjbnQgKiB2ZHNjX2NmZy0+Zmlyc3RfbGluZV9icGdf
b2Zmc2V0Ow0KPiAtCWVsc2UNCj4gLQkJb2Zmc2V0ICs9IGdyb3Vwc19wZXJfbGluZSAqIHZkc2Nf
Y2ZnLT5maXJzdF9saW5lX2JwZ19vZmZzZXQNCj4gLQkJCS0gKCgoZ3JwY250IC0gZ3JvdXBzX3Bl
cl9saW5lKSAqIHZkc2NfY2ZnLT5uZmxfYnBnX29mZnNldCkgPj4gMTEpOw0KPiAtDQo+IC0JaWYg
KHZkc2NfY2ZnLT5uYXRpdmVfNDIwKSB7DQo+IC0JCWlmIChncnBjbnQgPD0gZ3JvdXBzX3Blcl9s
aW5lKQ0KPiAtCQkJb2Zmc2V0IC09IChncnBjbnQgKiB2ZHNjX2NmZy0+bnNsX2JwZ19vZmZzZXQp
ID4+IDExOw0KPiAtCQllbHNlIGlmIChncnBjbnQgPD0gMiAqIGdyb3Vwc19wZXJfbGluZSkNCj4g
LQkJCW9mZnNldCArPSAoZ3JwY250IC0gZ3JvdXBzX3Blcl9saW5lKSAqIHZkc2NfY2ZnLT5zZWNv
bmRfbGluZV9icGdfb2Zmc2V0DQo+IC0JCQkJLSAoKGdyb3Vwc19wZXJfbGluZSAqIHZkc2NfY2Zn
LT5uc2xfYnBnX29mZnNldCkgPj4gMTEpOw0KPiAtCQllbHNlDQo+IC0JCQlvZmZzZXQgKz0gKGdy
cGNudCAtIGdyb3Vwc19wZXJfbGluZSkgKiB2ZHNjX2NmZy0+c2Vjb25kX2xpbmVfYnBnX29mZnNl
dA0KPiAtCQkJCS0gKCgoZ3JwY250IC0gZ3JvdXBzX3Blcl9saW5lKSAqIHZkc2NfY2ZnLT5uc2xf
YnBnX29mZnNldCkgPj4gMTEpOw0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiBvZmZzZXQ7DQo+IC19
DQo+IC0NCj4gLS8qKg0KPiAtICogZHJtX2RzY19jb21wdXRlX3JjX3BhcmFtZXRlcnMoKSAtIFdy
aXRlIHJhdGUgY29udHJvbA0KPiAtICogcGFyYW1ldGVycyB0byB0aGUgZHNjIGNvbmZpZ3VyYXRp
b24gZGVmaW5lZCBpbg0KPiAtICogJnN0cnVjdCBkcm1fZHNjX2NvbmZpZyBpbiBhY2NvcmRhbmNl
IHdpdGggdGhlIERTQyAxLjINCj4gLSAqIHNwZWNpZmljYXRpb24uIFNvbWUgY29uZmlndXJhdGlv
biBmaWVsZHMgbXVzdCBiZSBwcmVzZW50DQo+IC0gKiBiZWZvcmVoYW5kLg0KPiAtICoNCj4gLSAq
IEB2ZHNjX2NmZzoNCj4gLSAqIERTQyBDb25maWd1cmF0aW9uIGRhdGEgcGFydGlhbGx5IGZpbGxl
ZCBieSBkcml2ZXINCj4gLSAqLw0KPiAtaW50IGRybV9kc2NfY29tcHV0ZV9yY19wYXJhbWV0ZXJz
KHN0cnVjdCBkcm1fZHNjX2NvbmZpZyAqdmRzY19jZmcpDQo+IC17DQo+IC0JdW5zaWduZWQgbG9u
ZyBncm91cHNfcGVyX2xpbmUgPSAwOw0KPiAtCXVuc2lnbmVkIGxvbmcgZ3JvdXBzX3RvdGFsID0g
MDsNCj4gLQl1bnNpZ25lZCBsb25nIG51bV9leHRyYV9tdXhfYml0cyA9IDA7DQo+IC0JdW5zaWdu
ZWQgbG9uZyBzbGljZV9iaXRzID0gMDsNCj4gLQl1bnNpZ25lZCBsb25nIGhyZF9kZWxheSA9IDA7
DQo+IC0JdW5zaWduZWQgbG9uZyBmaW5hbF9zY2FsZSA9IDA7DQo+IC0JdW5zaWduZWQgbG9uZyBy
YnNfbWluID0gMDsNCj4gLQl1bnNpZ25lZCBsb25nIG1heF9vZmZzZXQgPSAwOw0KPiAtDQo+IC0J
aWYgKHZkc2NfY2ZnLT5uYXRpdmVfNDIwIHx8IHZkc2NfY2ZnLT5uYXRpdmVfNDIyKSB7DQo+IC0J
CS8qIE51bWJlciBvZiBncm91cHMgdXNlZCB0byBjb2RlIGVhY2ggbGluZSBvZiBhIHNsaWNlICov
DQo+IC0JCWdyb3Vwc19wZXJfbGluZSA9IERJVl9ST1VORF9VUCh2ZHNjX2NmZy0+c2xpY2Vfd2lk
dGggLyAyLA0KPiAtCQkJCQkgICAgICAgRFNDX1JDX1BJWEVMU19QRVJfR1JPVVApOw0KPiAtDQo+
IC0JCS8qIGNodW5rc2l6ZSBpbiBCeXRlcyAqLw0KPiAtCQl2ZHNjX2NmZy0+c2xpY2VfY2h1bmtf
c2l6ZSA9IERJVl9ST1VORF9VUCh2ZHNjX2NmZy0+c2xpY2Vfd2lkdGggLyAyICoNCj4gLQkJCQkJ
CQkgIHZkc2NfY2ZnLT5iaXRzX3Blcl9waXhlbCwNCj4gLQkJCQkJCQkgICg4ICogMTYpKTsNCj4g
LQl9IGVsc2Ugew0KPiAtCQkvKiBOdW1iZXIgb2YgZ3JvdXBzIHVzZWQgdG8gY29kZSBlYWNoIGxp
bmUgb2YgYSBzbGljZSAqLw0KPiAtCQlncm91cHNfcGVyX2xpbmUgPSBESVZfUk9VTkRfVVAodmRz
Y19jZmctPnNsaWNlX3dpZHRoLA0KPiAtCQkJCQkgICAgICAgRFNDX1JDX1BJWEVMU19QRVJfR1JP
VVApOw0KPiAtDQo+IC0JCS8qIGNodW5rc2l6ZSBpbiBCeXRlcyAqLw0KPiAtCQl2ZHNjX2NmZy0+
c2xpY2VfY2h1bmtfc2l6ZSA9IERJVl9ST1VORF9VUCh2ZHNjX2NmZy0+c2xpY2Vfd2lkdGggKg0K
PiAtCQkJCQkJCSAgdmRzY19jZmctPmJpdHNfcGVyX3BpeGVsLA0KPiAtCQkJCQkJCSAgKDggKiAx
NikpOw0KPiAtCX0NCj4gLQ0KPiAtCWlmICh2ZHNjX2NmZy0+Y29udmVydF9yZ2IpDQo+IC0JCW51
bV9leHRyYV9tdXhfYml0cyA9IDMgKiAodmRzY19jZmctPm11eF93b3JkX3NpemUgKw0KPiAtCQkJ
CQkgICg0ICogdmRzY19jZmctPmJpdHNfcGVyX2NvbXBvbmVudCArIDQpDQo+IC0JCQkJCSAgLSAy
KTsNCj4gLQllbHNlIGlmICh2ZHNjX2NmZy0+bmF0aXZlXzQyMikNCj4gLQkJbnVtX2V4dHJhX211
eF9iaXRzID0gNCAqIHZkc2NfY2ZnLT5tdXhfd29yZF9zaXplICsNCj4gLQkJCSg0ICogdmRzY19j
ZmctPmJpdHNfcGVyX2NvbXBvbmVudCArIDQpICsNCj4gLQkJCTMgKiAoNCAqIHZkc2NfY2ZnLT5i
aXRzX3Blcl9jb21wb25lbnQpIC0gMjsNCj4gLQllbHNlDQo+IC0JCW51bV9leHRyYV9tdXhfYml0
cyA9IDMgKiB2ZHNjX2NmZy0+bXV4X3dvcmRfc2l6ZSArDQo+IC0JCQkoNCAqIHZkc2NfY2ZnLT5i
aXRzX3Blcl9jb21wb25lbnQgKyA0KSArDQo+IC0JCQkyICogKDQgKiB2ZHNjX2NmZy0+Yml0c19w
ZXJfY29tcG9uZW50KSAtIDI7DQo+IC0JLyogTnVtYmVyIG9mIGJpdHMgaW4gb25lIFNsaWNlICov
DQo+IC0Jc2xpY2VfYml0cyA9IDggKiB2ZHNjX2NmZy0+c2xpY2VfY2h1bmtfc2l6ZSAqIHZkc2Nf
Y2ZnLT5zbGljZV9oZWlnaHQ7DQo+IC0NCj4gLQl3aGlsZSAoKG51bV9leHRyYV9tdXhfYml0cyA+
IDApICYmDQo+IC0JICAgICAgICgoc2xpY2VfYml0cyAtIG51bV9leHRyYV9tdXhfYml0cykgJSB2
ZHNjX2NmZy0+bXV4X3dvcmRfc2l6ZSkpDQo+IC0JCW51bV9leHRyYV9tdXhfYml0cy0tOw0KPiAt
DQo+IC0JaWYgKGdyb3Vwc19wZXJfbGluZSA8IHZkc2NfY2ZnLT5pbml0aWFsX3NjYWxlX3ZhbHVl
IC0gOCkNCj4gLQkJdmRzY19jZmctPmluaXRpYWxfc2NhbGVfdmFsdWUgPSBncm91cHNfcGVyX2xp
bmUgKyA4Ow0KPiAtDQo+IC0JLyogc2NhbGVfZGVjcmVtZW50X2ludGVydmFsIGNhbGN1bGF0aW9u
IGFjY29yZGluZyB0byBEU0Mgc3BlYyAxLjExICovDQo+IC0JaWYgKHZkc2NfY2ZnLT5pbml0aWFs
X3NjYWxlX3ZhbHVlID4gOCkNCj4gLQkJdmRzY19jZmctPnNjYWxlX2RlY3JlbWVudF9pbnRlcnZh
bCA9IGdyb3Vwc19wZXJfbGluZSAvDQo+IC0JCQkodmRzY19jZmctPmluaXRpYWxfc2NhbGVfdmFs
dWUgLSA4KTsNCj4gLQllbHNlDQo+IC0JCXZkc2NfY2ZnLT5zY2FsZV9kZWNyZW1lbnRfaW50ZXJ2
YWwgPSBEU0NfU0NBTEVfREVDUkVNRU5UX0lOVEVSVkFMX01BWDsNCj4gLQ0KPiAtCXZkc2NfY2Zn
LT5maW5hbF9vZmZzZXQgPSB2ZHNjX2NmZy0+cmNfbW9kZWxfc2l6ZSAtDQo+IC0JCSh2ZHNjX2Nm
Zy0+aW5pdGlhbF94bWl0X2RlbGF5ICoNCj4gLQkJIHZkc2NfY2ZnLT5iaXRzX3Blcl9waXhlbCAr
IDgpIC8gMTYgKyBudW1fZXh0cmFfbXV4X2JpdHM7DQo+IC0NCj4gLQlpZiAodmRzY19jZmctPmZp
bmFsX29mZnNldCA+PSB2ZHNjX2NmZy0+cmNfbW9kZWxfc2l6ZSkgew0KPiAtCQlEUk1fREVCVUdf
S01TKCJGaW5hbE9mcyA8IFJjTW9kZWxTemUgZm9yIHRoaXMgSW5pdGlhbFhtaXREZWxheVxuIik7
DQo+IC0JCXJldHVybiAtRVJBTkdFOw0KPiAtCX0NCj4gLQ0KPiAtCWZpbmFsX3NjYWxlID0gKHZk
c2NfY2ZnLT5yY19tb2RlbF9zaXplICogOCkgLw0KPiAtCQkodmRzY19jZmctPnJjX21vZGVsX3Np
emUgLSB2ZHNjX2NmZy0+ZmluYWxfb2Zmc2V0KTsNCj4gLQlpZiAodmRzY19jZmctPnNsaWNlX2hl
aWdodCA+IDEpDQo+IC0JCS8qDQo+IC0JCSAqIE5mbEJwZ09mZnNldCBpcyAxNiBiaXQgdmFsdWUg
d2l0aCAxMSBmcmFjdGlvbmFsIGJpdHMNCj4gLQkJICogaGVuY2Ugd2UgbXVsdGlwbHkgYnkgMl4x
MSBmb3IgcHJlc2VydmluZyB0aGUNCj4gLQkJICogZnJhY3Rpb25hbCBwYXJ0DQo+IC0JCSAqLw0K
PiAtCQl2ZHNjX2NmZy0+bmZsX2JwZ19vZmZzZXQgPSBESVZfUk9VTkRfVVAoKHZkc2NfY2ZnLT5m
aXJzdF9saW5lX2JwZ19vZmZzZXQgPDwgMTEpLA0KPiAtCQkJCQkJCSh2ZHNjX2NmZy0+c2xpY2Vf
aGVpZ2h0IC0gMSkpOw0KPiAtCWVsc2UNCj4gLQkJdmRzY19jZmctPm5mbF9icGdfb2Zmc2V0ID0g
MDsNCj4gLQ0KPiAtCS8qIDJeMTYgLSAxICovDQo+IC0JaWYgKHZkc2NfY2ZnLT5uZmxfYnBnX29m
ZnNldCA+IDY1NTM1KSB7DQo+IC0JCURSTV9ERUJVR19LTVMoIk5mbEJwZ09mZnNldCBpcyB0b28g
bGFyZ2UgZm9yIHRoaXMgc2xpY2UgaGVpZ2h0XG4iKTsNCj4gLQkJcmV0dXJuIC1FUkFOR0U7DQo+
IC0JfQ0KPiAtDQo+IC0JaWYgKHZkc2NfY2ZnLT5zbGljZV9oZWlnaHQgPiAyKQ0KPiAtCQl2ZHNj
X2NmZy0+bnNsX2JwZ19vZmZzZXQgPSBESVZfUk9VTkRfVVAoKHZkc2NfY2ZnLT5zZWNvbmRfbGlu
ZV9icGdfb2Zmc2V0IDw8IDExKSwNCj4gLQkJCQkJCQkodmRzY19jZmctPnNsaWNlX2hlaWdodCAt
IDEpKTsNCj4gLQllbHNlDQo+IC0JCXZkc2NfY2ZnLT5uc2xfYnBnX29mZnNldCA9IDA7DQo+IC0N
Cj4gLQlpZiAodmRzY19jZmctPm5zbF9icGdfb2Zmc2V0ID4gNjU1MzUpIHsNCj4gLQkJRFJNX0RF
QlVHX0tNUygiTnNsQnBnT2Zmc2V0IGlzIHRvbyBsYXJnZSBmb3IgdGhpcyBzbGljZSBoZWlnaHRc
biIpOw0KPiAtCQlyZXR1cm4gLUVSQU5HRTsNCj4gLQl9DQo+IC0NCj4gLQkvKiBOdW1iZXIgb2Yg
Z3JvdXBzIHVzZWQgdG8gY29kZSB0aGUgZW50aXJlIHNsaWNlICovDQo+IC0JZ3JvdXBzX3RvdGFs
ID0gZ3JvdXBzX3Blcl9saW5lICogdmRzY19jZmctPnNsaWNlX2hlaWdodDsNCj4gLQ0KPiAtCS8q
IHNsaWNlX2JwZ19vZmZzZXQgaXMgMTYgYml0IHZhbHVlIHdpdGggMTEgZnJhY3Rpb25hbCBiaXRz
ICovDQo+IC0JdmRzY19jZmctPnNsaWNlX2JwZ19vZmZzZXQgPSBESVZfUk9VTkRfVVAoKCh2ZHNj
X2NmZy0+cmNfbW9kZWxfc2l6ZSAtDQo+IC0JCQkJCQkgICAgdmRzY19jZmctPmluaXRpYWxfb2Zm
c2V0ICsNCj4gLQkJCQkJCSAgICBudW1fZXh0cmFfbXV4X2JpdHMpIDw8IDExKSwNCj4gLQkJCQkJ
CSAgZ3JvdXBzX3RvdGFsKTsNCj4gLQ0KPiAtCWlmIChmaW5hbF9zY2FsZSA+IDkpIHsNCj4gLQkJ
LyoNCj4gLQkJICogU2NhbGVJbmNyZW1lbnRJbnRlcnZhbCA9DQo+IC0JCSAqIGZpbmFsb2Zmc2V0
LygoTmZsQnBnT2Zmc2V0ICsgU2xpY2VCcGdPZmZzZXQpKjgoZmluYWxzY2FsZSAtIDEuMTI1KSkN
Cj4gLQkJICogYXMgKE5mbEJwZ09mZnNldCArIFNsaWNlQnBnT2Zmc2V0KSBoYXMgMTEgYml0IGZy
YWN0aW9uYWwgdmFsdWUsDQo+IC0JCSAqIHdlIG5lZWQgZGl2aWRlIGJ5IDJeMTEgZnJvbSBwc3RE
c2NDZmcgdmFsdWVzDQo+IC0JCSAqLw0KPiAtCQl2ZHNjX2NmZy0+c2NhbGVfaW5jcmVtZW50X2lu
dGVydmFsID0NCj4gLQkJCQkodmRzY19jZmctPmZpbmFsX29mZnNldCAqICgxIDw8IDExKSkgLw0K
PiAtCQkJCSgodmRzY19jZmctPm5mbF9icGdfb2Zmc2V0ICsNCj4gLQkJCQl2ZHNjX2NmZy0+bnNs
X2JwZ19vZmZzZXQgKw0KPiAtCQkJCXZkc2NfY2ZnLT5zbGljZV9icGdfb2Zmc2V0KSAqDQo+IC0J
CQkJKGZpbmFsX3NjYWxlIC0gOSkpOw0KPiAtCX0gZWxzZSB7DQo+IC0JCS8qDQo+IC0JCSAqIElm
IGZpbmFsU2NhbGVWYWx1ZSBpcyBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gOSwgYSB2YWx1ZSBvZiAw
IHNob3VsZA0KPiAtCQkgKiBiZSB1c2VkIHRvIGRpc2FibGUgdGhlIHNjYWxlIGluY3JlbWVudCBh
dCB0aGUgZW5kIG9mIHRoZSBzbGljZQ0KPiAtCQkgKi8NCj4gLQkJdmRzY19jZmctPnNjYWxlX2lu
Y3JlbWVudF9pbnRlcnZhbCA9IDA7DQo+IC0JfQ0KPiAtDQo+IC0JaWYgKHZkc2NfY2ZnLT5zY2Fs
ZV9pbmNyZW1lbnRfaW50ZXJ2YWwgPiA2NTUzNSkgew0KPiAtCQlEUk1fREVCVUdfS01TKCJTY2Fs
ZUluY3JlbWVudEludGVydmFsIGlzIGxhcmdlIGZvciBzbGljZSBoZWlnaHRcbiIpOw0KPiAtCQly
ZXR1cm4gLUVSQU5HRTsNCj4gLQl9DQo+IC0NCj4gLQkvKg0KPiAtCSAqIERTQyBzcGVjIG1lbnRp
b25zIHRoYXQgYml0c19wZXJfcGl4ZWwgc3BlY2lmaWVzIHRoZSB0YXJnZXQNCj4gLQkgKiBiaXRz
L3BpeGVsIChicHApIHJhdGUgdGhhdCBpcyB1c2VkIGJ5IHRoZSBlbmNvZGVyLA0KPiAtCSAqIGlu
IHN0ZXBzIG9mIDEvMTYgb2YgYSBiaXQgcGVyIHBpeGVsDQo+IC0JICovDQo+IC0JaWYgKHZkc2Nf
Y2ZnLT5kc2NfdmVyc2lvbl9taW5vciA9PSAyICYmICh2ZHNjX2NmZy0+bmF0aXZlXzQyMCB8fCB2
ZHNjX2NmZy0+bmF0aXZlXzQyMikpIHsNCj4gLQ0KPiAtCQltYXhfb2Zmc2V0ID0gY29tcHV0ZV9v
ZmZzZXQodmRzY19jZmcsIERTQ19SQ19QSVhFTFNfUEVSX0dST1VQLCBncm91cHNfcGVyX2xpbmUs
DQo+IC0JCQkJCURJVl9ST1VORF9VUCh2ZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5LA0KPiAt
CQkJCQkJRFNDX1JDX1BJWEVMU19QRVJfR1JPVVApKTsNCj4gLQ0KPiAtCQltYXhfb2Zmc2V0ID0g
TUFYKG1heF9vZmZzZXQsDQo+IC0JCQkJY29tcHV0ZV9vZmZzZXQodmRzY19jZmcsIERTQ19SQ19Q
SVhFTFNfUEVSX0dST1VQLCBncm91cHNfcGVyX2xpbmUsDQo+IC0JCQkJCURJVl9ST1VORF9VUCh2
ZHNjX2NmZy0+aW5pdGlhbF94bWl0X2RlbGF5LA0KPiAtCQkJCQkJZ3JvdXBzX3Blcl9saW5lKSkp
Ow0KPiAtDQo+IC0JCW1heF9vZmZzZXQgPSBNQVgobWF4X29mZnNldCwNCj4gLQkJCQljb21wdXRl
X29mZnNldCh2ZHNjX2NmZywgRFNDX1JDX1BJWEVMU19QRVJfR1JPVVAsIGdyb3Vwc19wZXJfbGlu
ZSwNCj4gLQkJCQkJRElWX1JPVU5EX1VQKHZkc2NfY2ZnLT5pbml0aWFsX3htaXRfZGVsYXksDQo+
IC0JCQkJCQlncm91cHNfcGVyX2xpbmUgKiAyKSkpOw0KPiAtDQo+IC0JCXJic19taW4gPSB2ZHNj
X2NmZy0+cmNfbW9kZWxfc2l6ZSAtIHZkc2NfY2ZnLT5pbml0aWFsX29mZnNldCArIG1heF9vZmZz
ZXQ7DQo+IC0JfSBlbHNlIHsNCj4gLQkJcmJzX21pbiA9IHZkc2NfY2ZnLT5yY19tb2RlbF9zaXpl
IC0gdmRzY19jZmctPmluaXRpYWxfb2Zmc2V0ICsNCj4gLQkJCURJVl9ST1VORF9VUCh2ZHNjX2Nm
Zy0+aW5pdGlhbF94bWl0X2RlbGF5ICoNCj4gLQkJCQkgICAgIHZkc2NfY2ZnLT5iaXRzX3Blcl9w
aXhlbCwgMTYpICsNCj4gLQkJCWdyb3Vwc19wZXJfbGluZSAqIHZkc2NfY2ZnLT5maXJzdF9saW5l
X2JwZ19vZmZzZXQ7DQo+IC0JfQ0KPiAtDQo+IC0JaHJkX2RlbGF5ID0gRElWX1JPVU5EX1VQKChy
YnNfbWluICogMTYpLCB2ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwpOw0KPiAtCXZkc2NfY2ZnLT5y
Y19iaXRzID0gKGhyZF9kZWxheSAqIHZkc2NfY2ZnLT5iaXRzX3Blcl9waXhlbCkgLyAxNjsNCj4g
LQl2ZHNjX2NmZy0+aW5pdGlhbF9kZWNfZGVsYXkgPSBocmRfZGVsYXkgLSB2ZHNjX2NmZy0+aW5p
dGlhbF94bWl0X2RlbGF5Ow0KPiAtDQo+IC0JLyogQXMgcGVyIERTQyBzcGVjIHYxLjJhIHJlY29t
bWVuZGF0aW9uOiAqLw0KPiAtCWlmICh2ZHNjX2NmZy0+bmF0aXZlXzQyMCkNCj4gLQkJdmRzY19j
ZmctPnNlY29uZF9saW5lX29mZnNldF9hZGogPSA1MTI7DQo+IC0JZWxzZQ0KPiAtCQl2ZHNjX2Nm
Zy0+c2Vjb25kX2xpbmVfb2Zmc2V0X2FkaiA9IDA7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gLX0N
Cj4gLUVYUE9SVF9TWU1CT0woZHJtX2RzY19jb21wdXRlX3JjX3BhcmFtZXRlcnMpOw0KPiANCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
