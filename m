Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A9A97CF6
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 16:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287416E94A;
	Wed, 21 Aug 2019 14:29:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F8A6E94A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 14:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGbcJlqBpNv0dXAZnZkyQ674a+gVm0PPA1PpqV068T6EVqC1Y/Yxloi8MO8IPDgNRSU0u9jNC6kGvwUVeiMQcxwP07TtjU9qPzxG7eS793jLXDD4wSA2bdZdyiCDtKEPL11uTpgsmJ0RCAKanuVWtMQrhiAQtI0JCX/gM0Xr94sM2LpBczrnsj89HTbVeawRqDE3D3ogDpjLv+uh++wYC+5kOpXABwIa9qhzp4Ru79Ao5kLBv6TJyCo9R67LXZDFalR1mwjCgJXHYHdxhWNeJWdVkMCwHXaOSWMNHJ9JWNjbmsAPZQveOUt8SCRw1ffkimge+CMEy0rXRj71caNu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13jcRS6vh4uDOrwrS7QY52E2x7KrrBKXR/i0EA6XzMw=;
 b=mada0DlMZnin+Eq2HXPM5Zwg605tB3iybY17WX21XxYWGo6pwYgVlU8Je2IxYTbK5E6uPKrO8VUATDPbLsH1ouvl0ifqc4socb36LlZxiDczkB4DRqctmeHFV9oAGRN+GONZySm0PY1lYQalCraOab3rcpMwBt+9PZjzyBxHrREaPImg/jcYD6mlpuPEwZeK6jAkRahig37ILq+FQSzVRW+2ptf6aCcDgjLGIOz05/EQftOy8p/T6EhW3Hy3NE9L34vR4XFgul4ecbV2XzKMfyxBefRNiE7z5u8nOMp60vg4jgMJP3l2ZviSVcN5GZaqd+0wPJEi1Egm0/FlIARXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3494.namprd12.prod.outlook.com (20.178.196.220) by
 BYAPR12MB2806.namprd12.prod.outlook.com (20.177.126.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 14:29:17 +0000
Received: from BYAPR12MB3494.namprd12.prod.outlook.com
 ([fe80::a8ea:9934:5a4e:57d1]) by BYAPR12MB3494.namprd12.prod.outlook.com
 ([fe80::a8ea:9934:5a4e:57d1%6]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 14:29:17 +0000
From: "Haehnle, Nicolai" <Nicolai.Haehnle@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: prevent memory leaks in AMDGPU_CS ioctl
Thread-Topic: [PATCH] drm/amdgpu: prevent memory leaks in AMDGPU_CS ioctl
Thread-Index: AQHVWCzPDxvD7ptZTEOwlSWW5eb4ew==
Date: Wed, 21 Aug 2019 14:29:16 +0000
Message-ID: <20190821142859.42579-1-nicolai.haehnle@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::16) To BYAPR12MB3494.namprd12.prod.outlook.com
 (2603:10b6:a03:ad::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [165.204.72.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96159c24-9b39-4a71-5969-08d72643f228
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2806; 
x-ms-traffictypediagnostic: BYAPR12MB2806:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2806E19734C2A80FF15C7319FFAA0@BYAPR12MB2806.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(189003)(199004)(81166006)(7736002)(8936002)(305945005)(71190400001)(64756008)(66556008)(486006)(2906002)(66476007)(26005)(66446008)(386003)(102836004)(86362001)(5660300002)(6116002)(6916009)(3846002)(8676002)(186003)(71200400001)(2616005)(6506007)(52116002)(476003)(66066001)(53936002)(256004)(14454004)(316002)(1076003)(2351001)(99286004)(81156014)(36756003)(6486002)(6436002)(50226002)(66946007)(2501003)(25786009)(6512007)(478600001)(5640700003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2806;
 H:BYAPR12MB3494.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ExzoXBNloNhiuS0X7eWW0gjo86FgfjHqA/Nq+c49t+Jk2Zim6fr8ZsNMzLCpsmXISVORQ+zHZLmjF3GxBL96gWcszNR0seH2kG6Z1+I0UDBLSTTDUfjfJbLfHojWskBNH26WfuvFQxoTcqhRXWCUJ/npIwjx5a2W0vfjmCN2+nabsNExIzzEgSpi67aQk5aSXddXQLQ90FbKI3m/0cDMSOKQs2wmSY4rugKQF7SzN4ke/T0XExOPACS1Q/qiXoltVNKpQ2Zp9/IE8ShxzUFdSUA3uLQaUPCxjzJg8L1XeA3YGJVc0x2pVYeS96FLAEXmztXxWs/R45Vi0/kiiey0ZhcQxq1+iAV9LImjl/SktH3Y0PmXLlpqt9obuc/2x/mr7SKN0hkZix7tTdg0OKBV9c7XJHRSBRIm59DsLGTlooc=
Content-ID: <E829457BC99F8F428BC9DC36186B5BA0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96159c24-9b39-4a71-5969-08d72643f228
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 14:29:16.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OsyufpcIFMmMAWmZFjTUTe3psUe5E8eHPAHfdw4j76v0KwEvCrUIcUuA5I/K3RJtygdALHWe0CS59crRgp/S2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13jcRS6vh4uDOrwrS7QY52E2x7KrrBKXR/i0EA6XzMw=;
 b=oDLndef9I+v/qpDEUCZRZb32cgKxzHFHJaS1nbuSoKUlc8Ta77YXA1OMOXpzKYRpBtv6NRCsfUAqMm8s7YssQ0qNkIiBWIHYj4lGGsleQX7GALWSP8IFYb4Lb1QyizCwvan+BZcE1qKyQwD84jlKtGHAFyZ7NXPn5FYrtZeE32k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicolai.Haehnle@amd.com; 
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
Cc: "Haehnle, Nicolai" <Nicolai.Haehnle@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RXJyb3Igb3V0IGlmIHRoZSBBTURHUFVfQ1MgaW9jdGwgaXMgY2FsbGVkIHdpdGggbXVsdGlwbGUg
U1lOQ09CSl9PVVQgYW5kL29yDQpUSU1FTElORV9TSUdOQUwgY2h1bmtzLCBzaW5jZSBvdGhlcndp
c2UgdGhlIGxhc3QgY2h1bmsgd2lucyB3aGlsZSB0aGUNCmFsbG9jYXRlZCBhcnJheSBhcyB3ZWxs
IGFzIHRoZSByZWZlcmVuY2UgY291bnRzIG9mIHN5bmMgb2JqZWN0cyBhcmUgbGVha2VkLg0KDQpT
aWduZWQtb2ZmLWJ5OiBOaWNvbGFpIEjDpGhubGUgPG5pY29sYWkuaGFlaG5sZUBhbWQuY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgfCA5ICsrKysrKyst
LQ0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQppbmRleCBkZWYwMjlhYjU2NTcuLmZk
OTViNTg2YjU5MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KQEAg
LTExMzQsMjAgKzExMzQsMjMgQEAgc3RhdGljIGludCBhbWRncHVfY3NfcHJvY2Vzc19zeW5jb2Jq
X291dF9kZXAoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsDQogCQkJCQkgICAgIHN0cnVjdCBh
bWRncHVfY3NfY2h1bmsgKmNodW5rKQ0KIHsNCiAJc3RydWN0IGRybV9hbWRncHVfY3NfY2h1bmtf
c2VtICpkZXBzOw0KIAl1bnNpZ25lZCBudW1fZGVwczsNCiAJaW50IGk7DQogDQogCWRlcHMgPSAo
c3RydWN0IGRybV9hbWRncHVfY3NfY2h1bmtfc2VtICopY2h1bmstPmtkYXRhOw0KIAludW1fZGVw
cyA9IGNodW5rLT5sZW5ndGhfZHcgKiA0IC8NCiAJCXNpemVvZihzdHJ1Y3QgZHJtX2FtZGdwdV9j
c19jaHVua19zZW0pOw0KIA0KKwlpZiAocC0+cG9zdF9kZXBzKQ0KKwkJcmV0dXJuIC1FSU5WQUw7
DQorDQogCXAtPnBvc3RfZGVwcyA9IGttYWxsb2NfYXJyYXkobnVtX2RlcHMsIHNpemVvZigqcC0+
cG9zdF9kZXBzKSwNCiAJCQkJICAgICBHRlBfS0VSTkVMKTsNCiAJcC0+bnVtX3Bvc3RfZGVwcyA9
IDA7DQogDQogCWlmICghcC0+cG9zdF9kZXBzKQ0KIAkJcmV0dXJuIC1FTk9NRU07DQogDQogDQog
CWZvciAoaSA9IDA7IGkgPCBudW1fZGVwczsgKytpKSB7DQogCQlwLT5wb3N0X2RlcHNbaV0uc3lu
Y29iaiA9DQpAQCAtMTE1NywzMSArMTE2MCwzMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wcm9j
ZXNzX3N5bmNvYmpfb3V0X2RlcChzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwNCiAJCXAtPnBv
c3RfZGVwc1tpXS5jaGFpbiA9IE5VTEw7DQogCQlwLT5wb3N0X2RlcHNbaV0ucG9pbnQgPSAwOw0K
IAkJcC0+bnVtX3Bvc3RfZGVwcysrOw0KIAl9DQogDQogCXJldHVybiAwOw0KIH0NCiANCiANCiBz
dGF0aWMgaW50IGFtZGdwdV9jc19wcm9jZXNzX3N5bmNvYmpfdGltZWxpbmVfb3V0X2RlcChzdHJ1
Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwNCi0JCQkJCQkgICAgICBzdHJ1Y3QgYW1kZ3B1X2NzX2No
dW5rDQotCQkJCQkJICAgICAgKmNodW5rKQ0KKwkJCQkJCSAgICAgIHN0cnVjdCBhbWRncHVfY3Nf
Y2h1bmsgKmNodW5rKQ0KIHsNCiAJc3RydWN0IGRybV9hbWRncHVfY3NfY2h1bmtfc3luY29iaiAq
c3luY29ial9kZXBzOw0KIAl1bnNpZ25lZCBudW1fZGVwczsNCiAJaW50IGk7DQogDQogCXN5bmNv
YmpfZGVwcyA9IChzdHJ1Y3QgZHJtX2FtZGdwdV9jc19jaHVua19zeW5jb2JqICopY2h1bmstPmtk
YXRhOw0KIAludW1fZGVwcyA9IGNodW5rLT5sZW5ndGhfZHcgKiA0IC8NCiAJCXNpemVvZihzdHJ1
Y3QgZHJtX2FtZGdwdV9jc19jaHVua19zeW5jb2JqKTsNCiANCisJaWYgKHAtPnBvc3RfZGVwcykN
CisJCXJldHVybiAtRUlOVkFMOw0KKw0KIAlwLT5wb3N0X2RlcHMgPSBrbWFsbG9jX2FycmF5KG51
bV9kZXBzLCBzaXplb2YoKnAtPnBvc3RfZGVwcyksDQogCQkJCSAgICAgR0ZQX0tFUk5FTCk7DQog
CXAtPm51bV9wb3N0X2RlcHMgPSAwOw0KIA0KIAlpZiAoIXAtPnBvc3RfZGVwcykNCiAJCXJldHVy
biAtRU5PTUVNOw0KIA0KIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2RlcHM7ICsraSkgew0KIAkJc3Ry
dWN0IGFtZGdwdV9jc19wb3N0X2RlcCAqZGVwID0gJnAtPnBvc3RfZGVwc1tpXTsNCiANCi0tIA0K
Mi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
