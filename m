Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2C9B83A
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 23:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC3C6ED57;
	Fri, 23 Aug 2019 21:33:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700077.outbound.protection.outlook.com [40.107.70.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DCD6ED4C
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 21:33:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1wxOA5dzia5RuEGHjYDrBZj+YnP/H3SY94bkK0+kAnL1ouPnHrG1WK7+2riHSu3nrrqjbv1y+SDGTzz4S/5lOWdaOQS3Cug+epNdfoXqjDwjUGBuWDAtUKQZ7DQYWJP1Ad7bqMYGCj+yZvCzoELkOev0rvYl5bujjBrWFXUXSXTMelpycaSymfNRRDD6dVEjQkTp9NdtO9St/uEzkCapRPUKnojbpD+A/PoI9Y0Qd8rHmIoNikJTGYruDSShIerExUQOI4xyxnjhu3Il1Zf6ui5JUeht7M0AkGAuD5t+XqMPqwmfPN01dI8u7n6ajKf4owKtAg+5MXn9Bd8mbdZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxXk7143QDu8NxlZR0RGcGi3ztNcWC7Oe13Yr/Y3CJ0=;
 b=Ann3EEh5do8PlZLpbaKBd1RxU5x44l6Satm4SbW85X6EfhiuVwScnPxJlg5yuzox4jXqKnA3ctlwPoyH8qRpS1SciHV66CQBz9YnCEzGHqtPt3Grm338872t0GYlDYbiQttLk1BRpao7ASK1QJrzCdhVw4e3dvroRLlapmZTJsudyb6O75H3CugUcy8osY6ICLx74w53GyYorsXHSz93iPQaLiAEycnhjNp2Sg7QvlHmB8m6hLiIRf//6w/zqxi7WzvlgsVP6dkOwr5tWRlghnrUrzsOOYNmArm7AYFQ3kS7Eyo8HfR2jicNQNNDmFihQLun00vRQcLxNfaBV0nfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3644.namprd12.prod.outlook.com (20.178.199.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 21:33:49 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 21:33:49 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdgpu: Determing PTE flags separately for each
 mapping
Thread-Topic: [PATCH 4/4] drm/amdgpu: Determing PTE flags separately for each
 mapping
Thread-Index: AQHVWfpywOmqzCS1nkm5g6hjoCAhhQ==
Date: Fri, 23 Aug 2019 21:33:47 +0000
Message-ID: <20190823213249.10749-5-Felix.Kuehling@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190823213249.10749-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ab24b30-63f2-45a1-6bd1-08d7281194ef
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3644; 
x-ms-traffictypediagnostic: DM6PR12MB3644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB36444DAA90396006F2B4188E92A40@DM6PR12MB3644.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(199004)(189003)(14444005)(50226002)(478600001)(86362001)(2616005)(4326008)(26005)(446003)(486006)(186003)(386003)(5640700003)(52116002)(66066001)(25786009)(81156014)(2906002)(14454004)(11346002)(102836004)(76176011)(54906003)(6916009)(66476007)(7736002)(2501003)(66946007)(66446008)(5660300002)(36756003)(6506007)(8676002)(8936002)(81166006)(6436002)(53936002)(71190400001)(6512007)(316002)(3846002)(6116002)(6486002)(476003)(66556008)(64756008)(71200400001)(305945005)(1076003)(99286004)(2351001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3644;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a2nyJDDRiw79f+cwRDBpwQ/el04p15BE2Yd9pca8ByGkvwBSMg6BEizoOrLQEZh5Lkwo9TJTIOVIXaJ6iNPBd43SIvbjTFL7i29gFDK2ZWduN+3Y2jJSTJHvAGrjyUc25qUHrMIQ/H2LE9XKp1AEXAk0i+EC2/VPkV6OcM327Odpb55DbhPO1yerkcb/98mWTV9FcdmluXN9fCjvO7mwBckt/MRC0ZcLB1FEvYir308IJmw+zC5mxdYv37MQ34gxWotXhTFgLgkHlmFeppb64dWC7zbWZ4epPUI8KoHd6HMyAOZp0f80q2HiXODeW+R0IzQZ/iaJXlkqjPSwU9320qDdPBPnwKHO5J1EVvMHY8IZdYbIoVmDVfSMbABw1Gnw4ia92WObx771YaH4Xnw8zwipRNza7EEOymjIqUBsDpM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab24b30-63f2-45a1-6bd1-08d7281194ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 21:33:47.6806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRMvfAdLXOTlpP9iI4cvsYAhiQNlZtwYftL1NwBBAg6XAc/+VMxoo9wbrrTfu1g24iESLkpmz/Chvb0MqAQKxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxXk7143QDu8NxlZR0RGcGi3ztNcWC7Oe13Yr/Y3CJ0=;
 b=gFeKxpZ4g18HH1IwrUU4Wg5JGcz1VftMGagtR1XgALNiwxVW9qrHNdDwCGFbYO1ydYaMQ2jaufnzcflbeIQz9kX0QzcoGobEebjv1+HFvKiEKKxYf5o2GfQPECXlyVVck14wCmknGQdgwcuFlNiczFHd+hKc2hD8kkeWWZdstvo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIHNhbWUgQk8gY2FuIGJlIG1hcHBlZCB3aXRoIGRpZmZlcmVudCBQVEUgZmxhZ3MgYnkgZGlm
ZmVyZW50IEdQVXMuClRoZXJlZm9yZSBkZXRlcm1pbmUgdGhlIFBURSBmbGFncyBzZXBhcmF0ZWx5
IGZvciBlYWNoIG1hcHBpbmcgaW5zdGVhZApvZiBzdG9yaW5nIHRoZW0gaW4gdGhlIGJ1ZmZlciBv
YmplY3QuCgpBZGQgYSBoZWxwZXIgZnVuY3Rpb24gdG8gZGV0ZXJtaW5lIHRoZSBQVEUgZmxhZ3Mg
d2l0aCBzcGVjaWFsIGxvZ2ljCmZvciBBcmN0dXJ1cyB0aGF0IHRha2VzIGFkdmFudGFnZXMgb2Yg
dGhlIG5ldyBNVFlQRV9SVyBhbmQgdGhlIGFiaWxpdHkKdG8gcHJvYmUtaW52YWxpZGF0ZSByZW1v
dGUgY2FjaGVzIG92ZXIgWEdNSS4KClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmQuaCAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYyAgfCA2MCArKysrKysrKysrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQ1
IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmQuaAppbmRleCBlNTE5ZGYzZmQyYjYuLjFhZjhmODNmN2UwMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaApAQCAtNTcsNyArNTcs
NyBAQCBzdHJ1Y3Qga2dkX21lbSB7CiAJdW5zaWduZWQgaW50IG1hcHBlZF90b19ncHVfbWVtb3J5
OwogCXVpbnQ2NF90IHZhOwogCi0JdWludDMyX3QgbWFwcGluZ19mbGFnczsKKwl1aW50MzJfdCBh
bGxvY19mbGFnczsKIAogCWF0b21pY190IGludmFsaWQ7CiAJc3RydWN0IGFtZGtmZF9wcm9jZXNz
X2luZm8gKnByb2Nlc3NfaW5mbzsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ3B1dm0uYwppbmRleCA0NGE1MmIwOWNjNTguLmRkMjRkOTUxN2RlMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwpA
QCAtMzEsNiArMzEsNyBAQAogI2luY2x1ZGUgImFtZGdwdV92bS5oIgogI2luY2x1ZGUgImFtZGdw
dV9hbWRrZmQuaCIKICNpbmNsdWRlICJhbWRncHVfZG1hX2J1Zi5oIgorI2luY2x1ZGUgImFtZGdw
dV94Z21pLmgiCiAKIC8qIFNwZWNpYWwgVk0gYW5kIEdBUlQgYWRkcmVzcyBhbGlnbm1lbnQgbmVl
ZGVkIGZvciBWSSBwcmUtRmlqaSBkdWUgdG8KICAqIGEgSFcgYnVnLgpAQCAtMzU1LDYgKzM1Niw0
MyBAQCBzdGF0aWMgaW50IHZtX3VwZGF0ZV9wZHMoc3RydWN0IGFtZGdwdV92bSAqdm0sIHN0cnVj
dCBhbWRncHVfc3luYyAqc3luYykKIAlyZXR1cm4gYW1kZ3B1X3N5bmNfZmVuY2UoTlVMTCwgc3lu
Yywgdm0tPmxhc3RfdXBkYXRlLCBmYWxzZSk7CiB9CiAKK3N0YXRpYyB1aW50MzJfdCBnZXRfcHRl
X2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qga2dkX21lbSAqbWVtKQor
eworCXN0cnVjdCBhbWRncHVfZGV2aWNlICpib19hZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KG1lbS0+
Ym8tPnRiby5iZGV2KTsKKwlib29sIGNvaGVyZW50ID0gbWVtLT5hbGxvY19mbGFncyAmIEFMTE9D
X01FTV9GTEFHU19DT0hFUkVOVDsKKwl1aW50MzJfdCBtYXBwaW5nX2ZsYWdzOworCisJbWFwcGlu
Z19mbGFncyA9IEFNREdQVV9WTV9QQUdFX1JFQURBQkxFOworCWlmIChtZW0tPmFsbG9jX2ZsYWdz
ICYgQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFKQorCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9W
TV9QQUdFX1dSSVRFQUJMRTsKKwlpZiAobWVtLT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFH
U19FWEVDVVRBQkxFKQorCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdFX0VYRUNVVEFC
TEU7CisKKwlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgeworCWNhc2UgQ0hJUF9BUkNUVVJVUzoK
KwkJaWYgKG1lbS0+YWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfVlJBTSkgeworCQkJaWYg
KGJvX2FkZXYgPT0gYWRldikgeworCQkJCW1hcHBpbmdfZmxhZ3MgfD0gY29oZXJlbnQgPworCQkJ
CQlBTURHUFVfVk1fTVRZUEVfQ0MgOiBBTURHUFVfVk1fTVRZUEVfUlc7CisJCQl9IGVsc2Ugewor
CQkJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBFX1VDOworCQkJCWlmIChhbWRncHVf
eGdtaV9zYW1lX2hpdmUoYWRldiwgYm9fYWRldikpCisJCQkJCW1hcHBpbmdfZmxhZ3MgfD0KKwkJ
CQkJCUFNREdQVV9WTV9QQUdFX0lOVkFMSURBVEVfUFJPQkU7CisJCQl9CisJCX0gZWxzZSB7CisJ
CQltYXBwaW5nX2ZsYWdzIHw9IGNvaGVyZW50ID8KKwkJCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBB
TURHUFVfVk1fTVRZUEVfTkM7CisJCX0KKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJbWFwcGluZ19m
bGFncyB8PSBjb2hlcmVudCA/CisJCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBBTURHUFVfVk1fTVRZ
UEVfTkM7CisJfQorCisJcmV0dXJuIGFtZGdwdV9nbWNfZ2V0X3B0ZV9mbGFncyhhZGV2LCBtYXBw
aW5nX2ZsYWdzKTsKK30KKwogLyogYWRkX2JvX3RvX3ZtIC0gQWRkIGEgQk8gdG8gYSBWTQogICoK
ICAqIEV2ZXJ5dGhpbmcgdGhhdCBuZWVkcyB0byBibyBkb25lIG9ubHkgb25jZSB3aGVuIGEgQk8g
aXMgZmlyc3QgYWRkZWQKQEAgLTQwMyw4ICs0NDEsNyBAQCBzdGF0aWMgaW50IGFkZF9ib190b192
bShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGtnZF9tZW0gKm1lbSwKIAl9CiAK
IAlib192YV9lbnRyeS0+dmEgPSB2YTsKLQlib192YV9lbnRyeS0+cHRlX2ZsYWdzID0gYW1kZ3B1
X2dtY19nZXRfcHRlX2ZsYWdzKGFkZXYsCi0JCQkJCQkJIG1lbS0+bWFwcGluZ19mbGFncyk7CisJ
Ym9fdmFfZW50cnktPnB0ZV9mbGFncyA9IGdldF9wdGVfZmxhZ3MoYWRldiwgbWVtKTsKIAlib192
YV9lbnRyeS0+a2dkX2RldiA9ICh2b2lkICopYWRldjsKIAlsaXN0X2FkZCgmYm9fdmFfZW50cnkt
PmJvX2xpc3QsIGxpc3RfYm9fdmEpOwogCkBAIC0xMDgxLDcgKzExMTgsNiBAQCBpbnQgYW1kZ3B1
X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAogCWludCBieXRlX2FsaWduOwogCXUz
MiBkb21haW4sIGFsbG9jX2RvbWFpbjsKIAl1NjQgYWxsb2NfZmxhZ3M7Ci0JdWludDMyX3QgbWFw
cGluZ19mbGFnczsKIAlpbnQgcmV0OwogCiAJLyoKQEAgLTExNDMsMTYgKzExNzksNyBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAogCQkJYWRldi0+YXNpY190
eXBlICE9IENISVBfVkVHQU0pID8KIAkJCVZJX0JPX1NJWkVfQUxJR04gOiAxOwogCi0JbWFwcGlu
Z19mbGFncyA9IEFNREdQVV9WTV9QQUdFX1JFQURBQkxFOwotCWlmIChmbGFncyAmIEFMTE9DX01F
TV9GTEFHU19XUklUQUJMRSkKLQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFHRV9XUklU
RUFCTEU7Ci0JaWYgKGZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFCTEUpCi0JCW1hcHBp
bmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRTsKLQlpZiAoZmxhZ3MgJiBBTExP
Q19NRU1fRkxBR1NfQ09IRVJFTlQpCi0JCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBF
X1VDOwotCWVsc2UKLQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVfTkM7Ci0JKCpt
ZW0pLT5tYXBwaW5nX2ZsYWdzID0gbWFwcGluZ19mbGFnczsKKwkoKm1lbSktPmFsbG9jX2ZsYWdz
ID0gZmxhZ3M7CiAKIAlhbWRncHVfc3luY19jcmVhdGUoJigqbWVtKS0+c3luYyk7CiAKQEAgLTE2
MjUsOSArMTY1MiwxMCBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9pbXBvcnRfZG1hYnVmKHN0
cnVjdCBrZ2RfZGV2ICprZ2QsCiAKIAlJTklUX0xJU1RfSEVBRCgmKCptZW0pLT5ib192YV9saXN0
KTsKIAltdXRleF9pbml0KCYoKm1lbSktPmxvY2spOwotCSgqbWVtKS0+bWFwcGluZ19mbGFncyA9
Ci0JCUFNREdQVV9WTV9QQUdFX1JFQURBQkxFIHwgQU1ER1BVX1ZNX1BBR0VfV1JJVEVBQkxFIHwK
LQkJQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRSB8IEFNREdQVV9WTV9NVFlQRV9OQzsKKwkoKm1l
bSktPmFsbG9jX2ZsYWdzID0KKwkJKChiby0+cHJlZmVycmVkX2RvbWFpbnMgJiBBTURHUFVfR0VN
X0RPTUFJTl9WUkFNKSA/CisJCSBBTExPQ19NRU1fRkxBR1NfVlJBTSA6IEFMTE9DX01FTV9GTEFH
U19HVFQpIHwKKwkJQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFIHwgQUxMT0NfTUVNX0ZMQUdTX0VY
RUNVVEFCTEU7CiAKIAkoKm1lbSktPmJvID0gYW1kZ3B1X2JvX3JlZihibyk7CiAJKCptZW0pLT52
YSA9IHZhOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
