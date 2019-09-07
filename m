Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89497AC87F
	for <lists+amd-gfx@lfdr.de>; Sat,  7 Sep 2019 19:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A462890EF;
	Sat,  7 Sep 2019 17:50:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE852890EF
 for <amd-gfx@lists.freedesktop.org>; Sat,  7 Sep 2019 17:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHTLu9F47xUJxdoEzBTpwo5Ooua4RNnY9uTlT6H6YOtmnplWHE7mqWgQilIDJMdKogKJIhpbHMaV1sRFt9StG/tlt9MdtvTHzT5vv3lR3U0pFdc2Bu1zOxJ/mZHeCsqEjrXKV2iuxYbGj6pJbgcWywu9upQlW+RmifR58LnIng4c/QCn20ymlWFsQzdTGmjn3WB3v30p07+A3FIgqHyKatDWHwuUxfLyUiwjmcoR2u/nxJbP8hRTvNngYFGJpdLX5LU4swS81grwkz7YBw5cuBGR1PbkfvQ2dmWJra2ztp5QE2cGcmmt5O8D9RJrRFhXPHUZYCmZS2gWjdjBHLXggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMymNMfervxM9IM7GyhhsJechtYJ7cEsHLOxjWzKk3o=;
 b=WCUg4+VrqZ4CPy1nUGGgNNeLRKCn/ihzyIJYRagD2IV8mBwq4ddHwOLQQSgjx+6yKqGHfZmrHCsg3GcEnrnLF4P/UrvW6+323fGvAkqA9qPou1NELlLnjVbveXENyMudFSybQVKi5A8GrTmti87GVw5fbRHGnKg8JqBPbrM6QsWPxV66vsZXWtmW+jDwQTaiMo6XPXdilZUw7QzsLBPuSP1x3vusZbwfcQtAHp7xXU4ViMgDg+VrniwLXOa8Ey8PiSjqlsvi062RSjc9crsPWS7SGWPq91Cd16Ae5LDJAcDRnf7LclR1kXClb1eXC5EiTElj1ik0YsBn0iEDlgtiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1446.namprd12.prod.outlook.com (10.172.72.19) by
 CY4PR12MB1333.namprd12.prod.outlook.com (10.168.169.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Sat, 7 Sep 2019 17:50:46 +0000
Received: from CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::99e8:9795:4ae4:4fc9]) by CY4PR12MB1446.namprd12.prod.outlook.com
 ([fe80::99e8:9795:4ae4:4fc9%6]) with mapi id 15.20.2199.021; Sat, 7 Sep 2019
 17:50:46 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Allow to reset to EERPOM table.
Thread-Topic: [PATCH] drm/amdgpu: Allow to reset to EERPOM table.
Thread-Index: AQHVZMWtbS/Gj+l+JE2W05/mUhJ8E6cgOriAgABFEe0=
Date: Sat, 7 Sep 2019 17:50:46 +0000
Message-ID: <CY4PR12MB14468755886544D354D77012EAB50@CY4PR12MB1446.namprd12.prod.outlook.com>
References: <1567782810-22378-1-git-send-email-andrey.grodzovsky@amd.com>,
 <CADnq5_Op_OnBdKrLpKD4_WZYd_+Jxd9NBcGfpmD8+4-qr6S8kw@mail.gmail.com>
In-Reply-To: <CADnq5_Op_OnBdKrLpKD4_WZYd_+Jxd9NBcGfpmD8+4-qr6S8kw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:3edf:fe95:2c24:703b:9ef6:d80b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69a0b5a1-3e2f-4e84-d482-08d733bbe9a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1333; 
x-ms-traffictypediagnostic: CY4PR12MB1333:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1333F6F7A1EFAD4617CFE743EAB50@CY4PR12MB1333.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:608;
x-forefront-prvs: 0153A8321A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(33656002)(2906002)(6116002)(25786009)(4326008)(316002)(55016002)(256004)(54906003)(14444005)(71190400001)(71200400001)(99286004)(86362001)(478600001)(966005)(14454004)(74316002)(7736002)(66476007)(305945005)(66946007)(8936002)(6916009)(5660300002)(81166006)(81156014)(8676002)(102836004)(1411001)(52536014)(76116006)(7696005)(76176011)(66556008)(53936002)(11346002)(446003)(476003)(486006)(6306002)(9686003)(6246003)(46003)(186003)(53546011)(6506007)(229853002)(6436002)(66446008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1333;
 H:CY4PR12MB1446.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cHlZ0mTNMnuLzZa6TKyrsPol33qyxfaNspNeFTr5mq5fB7o50FsemPc6BYWb3oJdHm59IV4CVYCrltCzsJKMaBAcxHLnwgG9oCDm8HnrCAxuih0Z8Ek1sGoYjG7kWOl/fwLKSF0nfxjjeZhq/A3LVioy39hutV749zdhOa6RqwoJ0pZ67Nst9oWAHV11tUyCWncdWKuhO4Ib8jpDlccxSLCPTDSpnTYEBtWN3vtR7Ys+6VbsULVNczf604Oz8sY3Sx+nmiIwueEtzXSfTnJ51xY9LF446XARnyOFqDLarSH+D+Y5Kp4rNPqmtzTkrlF7vto6Bk7LtxS/6iCSh2y8+8iuTy5ryYVvkCXQWhvqYAzaGrxKt0QBcP+2IwSYQx8uJPNV06M4JFZwiimL7k90XMCC+9VYprRlETI+SKd3QZg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a0b5a1-3e2f-4e84-d482-08d733bbe9a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2019 17:50:46.5180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 59BH/+5ZdBXTsZgZ5ql+vn0lLxgiM77eThMf+YOb42jNCJk8VAoaCeluP2YVgOES0wben6/oJXb/8hlak1Yq8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1333
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMymNMfervxM9IM7GyhhsJechtYJ7cEsHLOxjWzKk3o=;
 b=4iuuQ+yqunJnkRCKEwO3VxHpnwrsV1dzXnDD6ToJl940KAU2OGKHu5Pmu1/uiymQToI20G8Izi9uIMMJbyilGFB4RIofims/5/uvycX9ztZR1xSawxiC81++algZNNpmOJcGzmqJEs2Rgpp/5Ngw2tFZ7ziOKD2Kx0LWE6o+RKY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hhdCBhYm91dCBhZGRpbmcgbmV3IHZhbHVlIHRvIGV4aXN0aW5nIHJhc19jdGwgZGVidWdmcyBm
aWxlID8KCkFuZHJleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpG
cm9tOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4KU2VudDogMDcgU2VwdGVt
YmVyIDIwMTkgMDk6NDI6NDcKVG86IEdyb2R6b3Zza3ksIEFuZHJleQpDYzogYW1kLWdmeCBsaXN0
OyBaaG91MSwgVGFvOyBDaGVuLCBHdWNodW4KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdw
dTogQWxsb3cgdG8gcmVzZXQgdG8gRUVSUE9NIHRhYmxlLgoKT24gRnJpLCBTZXAgNiwgMjAxOSBh
dCAxMToxMyBBTSBBbmRyZXkgR3JvZHpvdnNreQo8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4g
d3JvdGU6Cj4KPiBUaGUgdGFibGUgZ3Jvd3MgcXVpY2tseSBkdXJpbmcgZGVidWcvZGV2ZWxvcG1l
bnQgZWZmb3J0IHdoZW4KPiBtdWx0aXBsZSBSQVMgZXJyb3JzIGFyZSBpbmplY3RlZC4gQWxsb3cg
dG8gYXZvaWQgdGhpcyBieSBzZXR0aW5nCj4gdGFibGUgaGVhZGVyIGJhY2sgdG8gZW1wdHkgaWYg
bmVlZGVkLgo+CgpQbGVhc2UgbWFrZSB0aGlzIGEgZGVidWdmcyBmaWxlIHJhdGhlciB0aGFuIGEg
bW9kdWxlIHBhcmFtZXRlciBzbyB0aGF0Cml0IGFuIGJlIHVwZGF0ZWQgYXQgcnVudGltZSBhbmQg
bW9yZSBlYXNpbHkgaGFuZGxlZCBvbiBhIHBlciBjYXJkCmJhc2lzLgoKQWxleAoKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgICAgICB8IDEg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAgICAgIHwgOCAr
KysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5j
IHwgMyArKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IGluZGV4IDBkMTFhYTguLjQw
NWM1NWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IEBAIC0xNjksNiAr
MTY5LDcgQEAgZXh0ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5Owo+ICBleHRlcm4gaW50IGFtZGdw
dV9tZXM7Cj4gIGV4dGVybiBpbnQgYW1kZ3B1X25vcmV0cnk7Cj4gIGV4dGVybiBpbnQgYW1kZ3B1
X2ZvcmNlX2FzaWNfdHlwZTsKPiArZXh0ZXJuIGludCBhbWRncHVfcmFzX2VlcHJvbV9yZXNldDsK
Pgo+ICAjaWZkZWYgQ09ORklHX0RSTV9BTURHUFVfU0kKPiAgZXh0ZXJuIGludCBhbWRncHVfc2lf
c3VwcG9ydDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gaW5kZXgg
NWE3ZjkyOS4uNmUxMDFhNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMKPiBAQCAtMTQ1LDYgKzE0NSw3IEBAIGludCBhbWRncHVfZGlzY292ZXJ5ID0gLTE7Cj4g
IGludCBhbWRncHVfbWVzID0gMDsKPiAgaW50IGFtZGdwdV9ub3JldHJ5ID0gMTsKPiAgaW50IGFt
ZGdwdV9mb3JjZV9hc2ljX3R5cGUgPSAtMTsKPiAraW50IGFtZGdwdV9yYXNfZWVwcm9tX3Jlc2V0
ID0gLTE7Cj4KPiAgc3RydWN0IGFtZGdwdV9tZ3B1X2luZm8gbWdwdV9pbmZvID0gewo+ICAgICAg
ICAgLm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpFUihtZ3B1X2luZm8ubXV0ZXgpLAo+IEBAIC01
MzAsNiArNTMxLDEzIEBAIE1PRFVMRV9QQVJNX0RFU0MocmFzX21hc2ssICJNYXNrIG9mIFJBUyBm
ZWF0dXJlcyB0byBlbmFibGUgKGRlZmF1bHQgMHhmZmZmZmZmZiksCj4gIG1vZHVsZV9wYXJhbV9u
YW1lZChyYXNfbWFzaywgYW1kZ3B1X3Jhc19tYXNrLCB1aW50LCAwNDQ0KTsKPgo+ICAvKioKPiAr
ICogRE9DOiByYXNfZWVwcm9tX3Jlc2V0IChpbnQpCj4gKyAqIFJlc2V0IEVFUFJPTSB0YWJsZSB0
byB6ZXJybyBlbnRyaWVzLgo+ICsgKi8KPiArTU9EVUxFX1BBUk1fREVTQyhyYXNfZWVwcm9tX3Jl
c2V0LCAiUmVzZXQgUkFTIEVFUFJPTSB0YWJsZSB0byB6ZXJybyBlbnRyaWVzICgxID0gcmVzZXQs
IC0xID0gYXV0byAoZGVmYXVsdCAtIGRvbid0IHJlc2V0KSIpOwo+ICttb2R1bGVfcGFyYW1fbmFt
ZWQocmFzX2VlcHJvbV9yZXNldCwgYW1kZ3B1X3Jhc19lZXByb21fcmVzZXQsIGludCwgMDQ0NCk7
Cj4gKwo+ICsvKioKPiAgICogRE9DOiBzaV9zdXBwb3J0IChpbnQpCj4gICAqIFNldCBTSSBzdXBw
b3J0IGRyaXZlci4gVGhpcyBwYXJhbWV0ZXIgd29ya3MgYWZ0ZXIgc2V0IGNvbmZpZyBDT05GSUdf
RFJNX0FNREdQVV9TSS4gRm9yIFNJIGFzaWMsIHdoZW4gcmFkZW9uIGRyaXZlciBpcyBlbmFibGVk
LAo+ICAgKiBzZXQgdmFsdWUgMCB0byB1c2UgcmFkZW9uIGRyaXZlciwgd2hpbGUgc2V0IHZhbHVl
IDEgdG8gdXNlIGFtZGdwdSBkcml2ZXIuIFRoZSBkZWZhdWx0IGlzIHVzaW5nIHJhZGVvbiBkcml2
ZXIgd2hlbiBpdCBhdmFpbGFibGUsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmFzX2VlcHJvbS5jCj4gaW5kZXggNDNkZDRhYi4uNzVjNmZjMCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYwo+IEBAIC0xNDAs
NyArMTQwLDggQEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX2luaXQoc3RydWN0IGFtZGdwdV9yYXNf
ZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpCj4KPiAgICAgICAgIF9fZGVjb2RlX3RhYmxlX2hlYWRl
cl9mcm9tX2J1ZmYoaGRyLCAmYnVmZlsyXSk7Cj4KPiAtICAgICAgIGlmIChoZHItPmhlYWRlciA9
PSBFRVBST01fVEFCTEVfSERSX1ZBTCkgewo+ICsgICAgICAgaWYgKGFtZGdwdV9yYXNfZWVwcm9t
X3Jlc2V0ICE9IDEgJiYKPiArICAgICAgICAgICBoZHItPmhlYWRlciA9PSBFRVBST01fVEFCTEVf
SERSX1ZBTCkgewo+ICAgICAgICAgICAgICAgICBjb250cm9sLT5udW1fcmVjcyA9IChoZHItPnRi
bF9zaXplIC0gRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFKSAvCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRUVQUk9NX1RBQkxFX1JFQ09SRF9TSVpFOwo+ICAgICAgICAgICAg
ICAgICBEUk1fREVCVUdfRFJJVkVSKCJGb3VuZCBleGlzdGluZyBFRVBST00gdGFibGUgd2l0aCAl
ZCByZWNvcmRzIiwKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
