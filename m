Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8246867064
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D44891EF;
	Fri, 12 Jul 2019 13:44:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2020891E7
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 13:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZn2SOKE3ykXhmJC3thBVijtzRkc/9Rh8d971RnFcjkNJCiOAtGHPyOWNCm+tKRtuggKGXgN6jWQqSaVjLYGEp9duneoyHnM4zSUh4wHFnMJryunMWGzUqILyOKjpvIlgVI16D2k2EOI/TIiPRaL+k0eiCvkLoVGa3xdRCRKWMY8o3/Ek0h7bBhVpc+DFXa2P9Y/t6cZQCNuJsiaNDzRpxFndRZ7bqRXXNdlYBnaWEn2ILagWNFdqXxfM667ckoRkhu8TpMp5beASjak+jyAfLzYelFO5hZN0fLZUBj5pw28eKCZLjX8iPa2a+Mw/g9VlOU2VoxlfAraEXQUaf7wDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDX8SeYQwHnjwsrQIZlYodCrifDuyHxgQKNogMj7pBA=;
 b=Cyghk/ZAuSTpREogr+Xt3AFKZctZJmlerRUKsUhih4mKOGGACYQ6SWGN961YVcxP21S1xpt4vsu46YZOSRS3PbTcLSF6eI0I1cRo1lxKC/GhLQq0ta8pOe5UG1DRbJdCkvACj222UprRDwl1pwo+I2cMWG5BzbGjaWwA2z4TevmH3/lQQ07v5xrdIzZxoTZi+uH7ih9csFh5eLwjgJ0FcNO/3SYp+6sUFdOTk+zGjRuglzxfGsmOzeC8bipJCB55Nr7uyVwyOTY3iy3ZRL0zI+oQR5VNQxXBx3iMIc6E1B8azPvm5IjrK2nvQGxB6c3BK/0vVUHpcVzNVyfFqNmngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1135.namprd12.prod.outlook.com (10.169.204.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 13:44:15 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626%7]) with mapi id 15.20.2052.022; Fri, 12 Jul 2019
 13:44:15 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/amdgpu: Add VMID to SRBM debugfs bank selection
Thread-Topic: [PATCH 1/2] drm/amd/amdgpu: Add VMID to SRBM debugfs bank
 selection
Thread-Index: AQHVOLflZ9DAqsnQoUis5kwtmlRqfA==
Date: Fri, 12 Jul 2019 13:44:15 +0000
Message-ID: <20190712134406.30374-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::13) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fd57458-be1b-4170-99ed-08d706cf077e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1135; 
x-ms-traffictypediagnostic: MWHPR12MB1135:
x-microsoft-antispam-prvs: <MWHPR12MB1135C32BABE8935D6268800DF7F20@MWHPR12MB1135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(316002)(305945005)(64756008)(8676002)(66446008)(66556008)(66946007)(66476007)(5660300002)(81156014)(71190400001)(71200400001)(6916009)(81166006)(7736002)(14444005)(66066001)(256004)(2616005)(486006)(478600001)(68736007)(476003)(1076003)(50226002)(8936002)(2906002)(102836004)(14454004)(15650500001)(25786009)(53936002)(6506007)(386003)(36756003)(26005)(186003)(2501003)(6486002)(99286004)(86362001)(52116002)(4326008)(6436002)(5640700003)(2351001)(3846002)(6116002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1135;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a7K1k1hW7HhKy799Sgv6kYsKagOtHrj7lm/BsIqrg9Pc6QYGsJRXLhZvLSiaSDRmE62df7l31VW2C3BunesZ9euYl+OcDjwYNtPQUcjw7IIcOYlFqtFtmbqp6kPrugTDX7IsaFlzPtCTw1i2dakz/p57nfqnxjxPOdyskxwVSHIjqHSx16Cx7CbfoIP+urXpy98Pn+PmaXu11RI7h/hXU16N6e2Al7JfabBkVR4fV+ftvhmKxxhuNAG3jdirO/W+oQlHHzDLhmfHB1JNVZkX8WcqkHrbX4URjJuAaZ+O2ZG0cim/2cUBEeBisFXBk/n2rv5Txqs4WBEUprCzk2v6vh7Pvka7KqFqhq6PJXttytvB3Pd+ignB6cag/Gs4BebyDRnHku5kIYmzqUq3RAnrS0PyE22fYeb398m2E9JfvPs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd57458-be1b-4170-99ed-08d706cf077e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 13:44:15.2420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDX8SeYQwHnjwsrQIZlYodCrifDuyHxgQKNogMj7pBA=;
 b=P8kTZEa2nkopDWsUqxs/JHYWiKjc79K6Hp5q70OdqaygBe0e/s+TrTaSMNnnzeWibwRdnaC7v1Iq7LVbyDR3rFQeek/ZLmjdIiOvFqYOItQ+ntCjWX2jsEUq3z5Ftg0SUaV39jwxNGhi9iSjPt5hOSikrcCP4Tk60JYRaCsKnJA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIDUgYml0cyB0byB0aGUgb2Zmc2V0IGZvciBTUkJNIHNlbGVjdGlvbiB0byBoYW5kbGUgVk1J
RHMuICBBbHNvCnVwZGF0ZSB0aGUgc2VsZWN0X21lX3BpcGVfcSgpIGNhbGxiYWNrIHRvIGFsc28g
c2VsZWN0IFZNSUQuCgpTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyB8
IDkgKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggICAg
IHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jICAgICAgIHwg
MiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYyAgICAgICB8IDQgKyst
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyAgICAgICB8IDQgKystLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgICAgICB8IDQgKystLQogNiBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwppbmRleCA0OTk3ZWZhMDljZTcu
Ljg3YjMyODczMDQ2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVi
dWdmcy5jCkBAIC0xMDMsMTAgKzEwMywxMCBAQCBzdGF0aWMgaW50ICBhbWRncHVfZGVidWdmc19w
cm9jZXNzX3JlZ19vcChib29sIHJlYWQsIHN0cnVjdCBmaWxlICpmLAogCXNzaXplX3QgcmVzdWx0
ID0gMDsKIAlpbnQgcjsKIAlib29sIHBtX3BnX2xvY2ssIHVzZV9iYW5rLCB1c2VfcmluZzsKLQl1
bnNpZ25lZCBpbnN0YW5jZV9iYW5rLCBzaF9iYW5rLCBzZV9iYW5rLCBtZSwgcGlwZSwgcXVldWU7
CisJdW5zaWduZWQgaW5zdGFuY2VfYmFuaywgc2hfYmFuaywgc2VfYmFuaywgbWUsIHBpcGUsIHF1
ZXVlLCB2bWlkOwogCiAJcG1fcGdfbG9jayA9IHVzZV9iYW5rID0gdXNlX3JpbmcgPSBmYWxzZTsK
LQlpbnN0YW5jZV9iYW5rID0gc2hfYmFuayA9IHNlX2JhbmsgPSBtZSA9IHBpcGUgPSBxdWV1ZSA9
IDA7CisJaW5zdGFuY2VfYmFuayA9IHNoX2JhbmsgPSBzZV9iYW5rID0gbWUgPSBwaXBlID0gcXVl
dWUgPSB2bWlkID0gMDsKIAogCWlmIChzaXplICYgMHgzIHx8ICpwb3MgJiAweDMgfHwKIAkJCSgo
KnBvcyAmICgxVUxMIDw8IDYyKSkgJiYgKCpwb3MgJiAoMVVMTCA8PCA2MSkpKSkKQEAgLTEzMiw2
ICsxMzIsNyBAQCBzdGF0aWMgaW50ICBhbWRncHVfZGVidWdmc19wcm9jZXNzX3JlZ19vcChib29s
IHJlYWQsIHN0cnVjdCBmaWxlICpmLAogCQltZSA9ICgqcG9zICYgR0VOTUFTS19VTEwoMzMsIDI0
KSkgPj4gMjQ7CiAJCXBpcGUgPSAoKnBvcyAmIEdFTk1BU0tfVUxMKDQzLCAzNCkpID4+IDM0Owog
CQlxdWV1ZSA9ICgqcG9zICYgR0VOTUFTS19VTEwoNTMsIDQ0KSkgPj4gNDQ7CisJCXZtaWQgPSAo
KnBvcyAmIEdFTk1BU0tfVUxMKDQ4LCA0NSkpID4+IDU0OwogCiAJCXVzZV9yaW5nID0gMTsKIAl9
IGVsc2UgewpAQCAtMTQ5LDcgKzE1MCw3IEBAIHN0YXRpYyBpbnQgIGFtZGdwdV9kZWJ1Z2ZzX3By
b2Nlc3NfcmVnX29wKGJvb2wgcmVhZCwgc3RydWN0IGZpbGUgKmYsCiAJCQkJCXNoX2JhbmssIGlu
c3RhbmNlX2JhbmspOwogCX0gZWxzZSBpZiAodXNlX3JpbmcpIHsKIAkJbXV0ZXhfbG9jaygmYWRl
di0+c3JibV9tdXRleCk7Ci0JCWFtZGdwdV9nZnhfc2VsZWN0X21lX3BpcGVfcShhZGV2LCBtZSwg
cGlwZSwgcXVldWUpOworCQlhbWRncHVfZ2Z4X3NlbGVjdF9tZV9waXBlX3EoYWRldiwgbWUsIHBp
cGUsIHF1ZXVlLCB2bWlkKTsKIAl9CiAKIAlpZiAocG1fcGdfbG9jaykKQEAgLTE4Miw3ICsxODMs
NyBAQCBzdGF0aWMgaW50ICBhbWRncHVfZGVidWdmc19wcm9jZXNzX3JlZ19vcChib29sIHJlYWQs
IHN0cnVjdCBmaWxlICpmLAogCQlhbWRncHVfZ2Z4X3NlbGVjdF9zZV9zaChhZGV2LCAweGZmZmZm
ZmZmLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmKTsKIAkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5ncmJt
X2lkeF9tdXRleCk7CiAJfSBlbHNlIGlmICh1c2VfcmluZykgewotCQlhbWRncHVfZ2Z4X3NlbGVj
dF9tZV9waXBlX3EoYWRldiwgMCwgMCwgMCk7CisJCWFtZGdwdV9nZnhfc2VsZWN0X21lX3BpcGVf
cShhZGV2LCAwLCAwLCAwLCAwKTsKIAkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsK
IAl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZngu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAppbmRleCBmOTY0MDdi
YTk3NzAuLjExOTliNTgyOGI5MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dmeC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZnguaApAQCAtMTk1LDcgKzE5NSw3IEBAIHN0cnVjdCBhbWRncHVfZ2Z4X2Z1bmNzIHsKIAkJCQl1
aW50MzJfdCB3YXZlLCB1aW50MzJfdCBzdGFydCwgdWludDMyX3Qgc2l6ZSwKIAkJCQl1aW50MzJf
dCAqZHN0KTsKIAl2b2lkICgqc2VsZWN0X21lX3BpcGVfcSkoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHUzMiBtZSwgdTMyIHBpcGUsCi0JCQkJIHUzMiBxdWV1ZSk7CisJCQkJIHUzMiBxdWV1
ZSwgdTMyIHZtaWQpOwogfTsKIAogc3RydWN0IGFtZGdwdV9uZ2dfYnVmIHsKQEAgLTMyNyw3ICsz
MjcsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2dmeCB7CiAKICNkZWZpbmUgYW1kZ3B1X2dmeF9nZXRfZ3B1
X2Nsb2NrX2NvdW50ZXIoYWRldikgKGFkZXYpLT5nZnguZnVuY3MtPmdldF9ncHVfY2xvY2tfY291
bnRlcigoYWRldikpCiAjZGVmaW5lIGFtZGdwdV9nZnhfc2VsZWN0X3NlX3NoKGFkZXYsIHNlLCBz
aCwgaW5zdGFuY2UpIChhZGV2KS0+Z2Z4LmZ1bmNzLT5zZWxlY3Rfc2Vfc2goKGFkZXYpLCAoc2Up
LCAoc2gpLCAoaW5zdGFuY2UpKQotI2RlZmluZSBhbWRncHVfZ2Z4X3NlbGVjdF9tZV9waXBlX3Eo
YWRldiwgbWUsIHBpcGUsIHEpIChhZGV2KS0+Z2Z4LmZ1bmNzLT5zZWxlY3RfbWVfcGlwZV9xKChh
ZGV2KSwgKG1lKSwgKHBpcGUpLCAocSkpCisjZGVmaW5lIGFtZGdwdV9nZnhfc2VsZWN0X21lX3Bp
cGVfcShhZGV2LCBtZSwgcGlwZSwgcSwgdm1pZCkgKGFkZXYpLT5nZnguZnVuY3MtPnNlbGVjdF9t
ZV9waXBlX3EoKGFkZXYpLCAobWUpLCAocGlwZSksIChxKSwgKHZtaWQpKQogCiAvKioKICAqIGFt
ZGdwdV9nZnhfY3JlYXRlX2JpdG1hc2sgLSBjcmVhdGUgYSBiaXRtYXNrCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y2XzAuYwppbmRleCAwNzQ1MzcwNDkzZjMuLjhjMjdjMzA1ZTY5MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jCkBAIC0zMDQxLDcgKzMwNDEsNyBAQCBz
dGF0aWMgdm9pZCBnZnhfdjZfMF9yZWFkX3dhdmVfc2dwcnMoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IHNpbWQsCiB9CiAKIHN0YXRpYyB2b2lkIGdmeF92Nl8wX3NlbGVjdF9t
ZV9waXBlX3Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCQkJICB1MzIgbWUsIHUzMiBw
aXBlLCB1MzIgcSkKKwkJCQkgIHUzMiBtZSwgdTMyIHBpcGUsIHUzMiBxLCB1MzIgdm0pCiB7CiAJ
RFJNX0lORk8oIk5vdCBpbXBsZW1lbnRlZFxuIik7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y3XzAuYwppbmRleCBiYzVmZjgyNTY1ZDIuLmUxZTJhNDRlZTEzYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jCkBAIC00MTY3LDkgKzQxNjcsOSBAQCBzdGF0aWMgdm9p
ZCBnZnhfdjdfMF9yZWFkX3dhdmVfc2dwcnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVp
bnQzMl90IHNpbWQsCiB9CiAKIHN0YXRpYyB2b2lkIGdmeF92N18wX3NlbGVjdF9tZV9waXBlX3Eo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCQkJICB1MzIgbWUsIHUzMiBwaXBlLCB1MzIg
cSkKKwkJCQkgIHUzMiBtZSwgdTMyIHBpcGUsIHUzMiBxLCB1MzIgdm0pCiB7Ci0JY2lrX3NyYm1f
c2VsZWN0KGFkZXYsIG1lLCBwaXBlLCBxLCAwKTsKKwljaWtfc3JibV9zZWxlY3QoYWRldiwgbWUs
IHBpcGUsIHEsIHZtKTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ2Z4X2Z1bmNz
IGdmeF92N18wX2dmeF9mdW5jcyA9IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5j
CmluZGV4IDEzNDMyYTkyMTBhMy4uOGM1OTBhNTU0Njc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OF8wLmMKQEAgLTM0MzIsOSArMzQzMiw5IEBAIHN0YXRpYyB2b2lkIGdmeF92OF8w
X3NlbGVjdF9zZV9zaChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIH0KIAogc3RhdGljIHZv
aWQgZ2Z4X3Y4XzBfc2VsZWN0X21lX3BpcGVfcShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
LQkJCQkgIHUzMiBtZSwgdTMyIHBpcGUsIHUzMiBxKQorCQkJCSAgdTMyIG1lLCB1MzIgcGlwZSwg
dTMyIHEsIHUzMiB2bSkKIHsKLQl2aV9zcmJtX3NlbGVjdChhZGV2LCBtZSwgcGlwZSwgcSwgMCk7
CisJdmlfc3JibV9zZWxlY3QoYWRldiwgbWUsIHBpcGUsIHEsIHZtKTsKIH0KIAogc3RhdGljIHUz
MiBnZnhfdjhfMF9nZXRfcmJfYWN0aXZlX2JpdG1hcChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGVkNDhkZWYxMmRiMS4u
ZDIwZDU1MTk5YTFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTEz
MDksOSArMTMwOSw5IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX3JlYWRfd2F2ZV92Z3BycyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgc2ltZCwKIH0KIAogc3RhdGljIHZvaWQg
Z2Z4X3Y5XzBfc2VsZWN0X21lX3BpcGVfcShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKLQkJ
CQkgIHUzMiBtZSwgdTMyIHBpcGUsIHUzMiBxKQorCQkJCSAgdTMyIG1lLCB1MzIgcGlwZSwgdTMy
IHEsIHUzMiB2bSkKIHsKLQlzb2MxNV9ncmJtX3NlbGVjdChhZGV2LCBtZSwgcGlwZSwgcSwgMCk7
CisJc29jMTVfZ3JibV9zZWxlY3QoYWRldiwgbWUsIHBpcGUsIHEsIHZtKTsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBhbWRncHVfZ2Z4X2Z1bmNzIGdmeF92OV8wX2dmeF9mdW5jcyA9IHsKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
