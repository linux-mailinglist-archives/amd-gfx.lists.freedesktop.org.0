Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE90DB3FFF
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A48B6EA1F;
	Mon, 16 Sep 2019 18:06:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710069.outbound.protection.outlook.com [40.107.71.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709A16EA1B
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw2N/UJiBdO5HD0NlguFh6xXAHm6cBZ7i0yHIMR8zLKwnYBcuoxyD7Id8XnOtG0XUlrID85RqwfDUjnBstxMgChimTfLZd8ehoamyrF3aUqdo1FtEytYqRnYJlGEHqI0lKPZyeIlo2vxzkKtAWcEzjTRDq5/eqBhlzK+/YTnr1geuSr1ZejSp5MOSvJoX671len4oMMHD5mgK6+VXTjj2rWX70JodII3ilbnQoNiQgF4l+rsdTIKTCqW6Hjz+qNsxtV55xCLWcj9/GglkoH+Y1S9YFQMNmwFxvEmT18mcVpAHCejPzyMeDz5QCr57gM3gcrhAvDEm5KKkCWSAzqe5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=711Jd8G4QLnfXo8Geb9rDE+s6CJ27sbOe3weF+9imtc=;
 b=nHL0jxRaVC5vqzuSNKsIyYTTdfmWJMkPakxbtDnJDCANBiZmHdSdhgs10+GlOeYB6tDa0pEIL/SQV/osTv5ADZUEM68DZRoIgxKLlKzAW3lPLwIjF1CEe/epNzqsFamn91xl4mbuHZL1KWHJTLgKX8I5OVJIItYbv/MvXOY1Hri4YRsZEM1Wb2XKf7O1oEis+mKWPaNApnfFW8vPh6A99aIbCVaT8uitR4aK7wCSQpPqNDh+9hlK1tUUhjybGSHoP/ngi9dKBf2OuimaJXurfxQPFiwggFfPY4Qg3BMSfwFb0TUpNHuS8zkBM3328z2AIkXmIQzEd5N1WhkCdT5lSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) by
 MN2PR12MB3871.namprd12.prod.outlook.com (10.255.237.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Mon, 16 Sep 2019 18:05:55 +0000
Received: from MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee]) by MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 18:05:55 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "tj@kernel.org" <tj@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@redhat.com" <airlied@redhat.com>
Subject: [PATCH v2 2/4] drm/amd: Pass drm_device to kfd
Thread-Topic: [PATCH v2 2/4] drm/amd: Pass drm_device to kfd
Thread-Index: AQHVbLliAvK2ymwTg0el4vkyWPjMIQ==
Date: Mon, 16 Sep 2019 18:05:54 +0000
Message-ID: <20190916180523.27341-3-Harish.Kasiviswanathan@amd.com>
References: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To MN2PR12MB2911.namprd12.prod.outlook.com
 (2603:10b6:208:a9::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa1762c5-5e80-4318-e897-08d73ad08482
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3871; 
x-ms-traffictypediagnostic: MN2PR12MB3871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3871937F7DD0A1CA7E9154ED8C8C0@MN2PR12MB3871.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(50226002)(5660300002)(2906002)(486006)(76176011)(53936002)(36756003)(66946007)(6512007)(1076003)(66556008)(66476007)(64756008)(52116002)(81156014)(8676002)(66446008)(6436002)(14454004)(86362001)(478600001)(446003)(11346002)(81166006)(71190400001)(2501003)(2616005)(4326008)(476003)(71200400001)(25786009)(3846002)(14444005)(8936002)(6486002)(6116002)(256004)(54906003)(110136005)(99286004)(6506007)(66066001)(7736002)(386003)(305945005)(26005)(186003)(316002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3871;
 H:MN2PR12MB2911.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8to5owsAdcbQ/jYV9/YvCgpRV9ptSbWhiwRGnmhn/ICcgesRBihCZZ8/e6FspxkPgsOaJ6FDHPu/OjDzy3nWZ5ZaT+jsLHgXjdQ//+pjqCPk1NND8FdbfouZPtEDMfL8oENGHllljr9S0r5wZPG/HyCcMSIy2GealEnZquz4q07tCVTxB3Lkyc6DuyZSU/vH6b54xzqS/8RWUgwXPsdG/m23HyG8IxH49uYMcmRL+h2QJzEL6edr1+QCJJCM7w8quSw8kHG1t9psYMzR1LGt5yuNDdPX+VXiPTCsSsyLoTLCjoKDg2Eq5S/1F1EsTKH0mm3J+2Jgnm55lzxOvRds+9wFFY868+Hfww0PuP6dYGsXkaORn8bQSYFzf0stdqOEZD63AsIziHiodxrYOJC47U1ODzv6GzxXEecxo0DxOCc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1762c5-5e80-4318-e897-08d73ad08482
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 18:05:54.9583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zoQX0yMzVtr0nVO0wncBL3BFnw1Q6lgHjPiF3BH3Dw4E/S2DOaUSSUdPFRnDp6D4RAk8aEpFzGFoacI2L1AiLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=711Jd8G4QLnfXo8Geb9rDE+s6CJ27sbOe3weF+9imtc=;
 b=r1grLvkXquuOEcDyspdLVl9/6rTLIrxjBP2AaeTOBywnBbbvn4b64RDRN3kAlx84v44VUbebD9bKwIcpGi6Rm6SSWar7KeDw9fTD1UQUqU98nvQhYd6SyqAJvLBmrmYxr4WdkG/7Ex6KY/mW9TJBdEZ2dUXN/IZxZIp09+Pu5QI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

a2ZkIG5lZWRzIGRybV9kZXZpY2UgdG8gY2FsbCBpbnRvIGRybV9jZ3JvdXAgZnVuY3Rpb25zCgpT
aWduZWQtb2ZmLWJ5OiBIYXJpc2ggS2FzaXZpc3dhbmF0aGFuIDxIYXJpc2guS2FzaXZpc3dhbmF0
aGFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMg
fCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggfCAxICsK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyAgICB8IDIgKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICB8IDMgKysrCiA0IGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYwppbmRleCAzNjMwMDU1MjZkN2IuLjY4MWE0YTlmZjUx
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYwpAQCAtMjA0
LDcgKzIwNCw3IEBAIHZvaWQgYW1kZ3B1X2FtZGtmZF9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAkJCQkJYWRldi0+ZG9vcmJlbGxfaW5kZXgubGFzdF9ub25fY3A7CiAJ
CX0KIAotCQlrZ2Qya2ZkX2RldmljZV9pbml0KGFkZXYtPmtmZC5kZXYsICZncHVfcmVzb3VyY2Vz
KTsKKwkJa2dkMmtmZF9kZXZpY2VfaW5pdChhZGV2LT5rZmQuZGV2LCBhZGV2LT5kZGV2LCAmZ3B1
X3Jlc291cmNlcyk7CiAJfQogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkLmgKaW5kZXggZTM5YzEwNmFjNjM0Li40ZWIyZmI4NWRlMjYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgKQEAgLTI1MSw2ICsyNTEsNyBAQCBzdHJ1
Y3Qga2ZkX2RldiAqa2dkMmtmZF9wcm9iZShzdHJ1Y3Qga2dkX2RldiAqa2dkLCBzdHJ1Y3QgcGNp
X2RldiAqcGRldiwKIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBrZmQya2dkX2NhbGxzICpmMmcsCiAJ
CQkgICAgICB1bnNpZ25lZCBpbnQgYXNpY190eXBlLCBib29sIHZmKTsKIGJvb2wga2dkMmtmZF9k
ZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLAorCQkJIHN0cnVjdCBkcm1fZGV2aWNlICpk
ZGV2LAogCQkJIGNvbnN0IHN0cnVjdCBrZ2Qya2ZkX3NoYXJlZF9yZXNvdXJjZXMgKmdwdV9yZXNv
dXJjZXMpOwogdm9pZCBrZ2Qya2ZkX2RldmljZV9leGl0KHN0cnVjdCBrZmRfZGV2ICprZmQpOwog
dm9pZCBrZ2Qya2ZkX3N1c3BlbmQoc3RydWN0IGtmZF9kZXYgKmtmZCk7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKaW5kZXggZjMyOWI4MmYxMWQ5Li4wNjQ2MWFjNzMwZDQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKQEAgLTUxNCwxMCArNTE0
LDEyIEBAIHN0YXRpYyB2b2lkIGtmZF9jd3NyX2luaXQoc3RydWN0IGtmZF9kZXYgKmtmZCkKIH0K
IAogYm9vbCBrZ2Qya2ZkX2RldmljZV9pbml0KHN0cnVjdCBrZmRfZGV2ICprZmQsCisJCQkgc3Ry
dWN0IGRybV9kZXZpY2UgKmRkZXYsCiAJCQkgY29uc3Qgc3RydWN0IGtnZDJrZmRfc2hhcmVkX3Jl
c291cmNlcyAqZ3B1X3Jlc291cmNlcykKIHsKIAl1bnNpZ25lZCBpbnQgc2l6ZTsKIAorCWtmZC0+
ZGRldiA9IGRkZXY7CiAJa2ZkLT5tZWNfZndfdmVyc2lvbiA9IGFtZGdwdV9hbWRrZmRfZ2V0X2Z3
X3ZlcnNpb24oa2ZkLT5rZ2QsCiAJCQlLR0RfRU5HSU5FX01FQzEpOwogCWtmZC0+c2RtYV9md192
ZXJzaW9uID0gYW1kZ3B1X2FtZGtmZF9nZXRfZndfdmVyc2lvbihrZmQtPmtnZCwKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCmluZGV4IDA2YmIyZDdhOWIzOS4uOWM1NmJhNmVjODI2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKQEAgLTQ3LDYgKzQ3LDggQEAK
IC8qIEdQVSBJRCBoYXNoIHdpZHRoIGluIGJpdHMgKi8KICNkZWZpbmUgS0ZEX0dQVV9JRF9IQVNI
X1dJRFRIIDE2CiAKK3N0cnVjdCBkcm1fZGV2aWNlOworCiAvKiBVc2UgdXBwZXIgYml0cyBvZiBt
bWFwIG9mZnNldCB0byBzdG9yZSBLRkQgZHJpdmVyIHNwZWNpZmljIGluZm9ybWF0aW9uLgogICog
QklUU1s2Mzo2Ml0gLSBFbmNvZGUgTU1BUCB0eXBlCiAgKiBCSVRTWzYxOjQ2XSAtIEVuY29kZSBn
cHVfaWQuIFRvIGlkZW50aWZ5IHRvIHdoaWNoIEdQVSB0aGUgb2Zmc2V0IGJlbG9uZ3MgdG8KQEAg
LTIzMCw2ICsyMzIsNyBAQCBzdHJ1Y3Qga2ZkX2RldiB7CiAKIAljb25zdCBzdHJ1Y3Qga2ZkX2Rl
dmljZV9pbmZvICpkZXZpY2VfaW5mbzsKIAlzdHJ1Y3QgcGNpX2RldiAqcGRldjsKKwlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGRldjsKIAogCXVuc2lnbmVkIGludCBpZDsJCS8qIHRvcG9sb2d5IHN0dWIg
aW5kZXggKi8KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
