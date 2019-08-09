Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35C8707B
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 06:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282DA6ECF9;
	Fri,  9 Aug 2019 04:21:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B356ECF9
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 04:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShFV8sII39Moe3mBGTy5LgtM5EYexebYJQkt84l7HiDQMi7wYp1urOZPl2o4WEnt8B8muXZKSyn5z4vjtLxcT9M1RBO/hafalZ7DwwagqEW4DxOioAf59Md0dT3lZ44qFbRTFkzSzdR+1RjlSfDWQhGiznf3YXNqwARAl23EP213wI59pG18wFczkTAgzXbrGRmMJdKVmRqeYb84YQh7xvWiwC3sT3Aw25o7bnrv3O5kkUHlJIrNHKcOA40s0Ak9+knGsZFNpf42kz6DUpAlbyr5uibmWWPRnZ8RFBaGPtLZ6hf4MqxgcRY5CiJWucyRK95r29ugGj1N++CBfrmjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vtl6kxDSdLB6tq9Byqmof8rP+JeITGYW5QantiYHWc=;
 b=oZ80BQwPPKNettZfHSguKcuLZfODy7QatEqERpIp23r8eZb9pXG6sGlyt/o6OKE12GvwF3+weJ1wDLSgHD7i8NM2Q3gSTskYpc+bFsX3lF6H/7MwYNQNoj3BQdy0iCTsQi44xdoM3CeKKw2vQjWMasjhIfYAwZR10BgacyRDOtvylugYKeZ/K7zYksPMBD59lGzPnqfsL/H+ZUET7DPogs/rUL3YN9YWke3/pbSUPPhrxsrN0WoEaJ0Nf/p5EvMusNy94RirJ17H0Y6tJ68qz4KyZL5M06ya7T6oIYgqiTxX/bHw5eSvxNZ39x2M+SL+2afiG9wFWE3u4qgJLIs6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2401.namprd12.prod.outlook.com (52.132.11.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 9 Aug 2019 04:21:52 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 04:21:52 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd/gfx10: Calling amdgpu functions to invalidate
 TLB
Thread-Topic: [PATCH 2/2] drm/amdkfd/gfx10: Calling amdgpu functions to
 invalidate TLB
Thread-Index: AQHVTmn4fvQIbsCVx0mcT9Ma4Op4IQ==
Date: Fri, 9 Aug 2019 04:21:52 +0000
Message-ID: <1565324504-4445-2-git-send-email-Oak.Zeng@amd.com>
References: <1565324504-4445-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565324504-4445-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::49) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7803d97-c388-4546-fd42-08d71c811aec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2401; 
x-ms-traffictypediagnostic: BL0PR12MB2401:
x-microsoft-antispam-prvs: <BL0PR12MB24015FE7CA9BA2547C2B5A1A80D60@BL0PR12MB2401.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(199004)(189003)(71200400001)(6486002)(50226002)(66066001)(486006)(4326008)(6916009)(86362001)(8936002)(2906002)(6512007)(6436002)(476003)(2616005)(11346002)(446003)(36756003)(3846002)(386003)(6116002)(26005)(7736002)(186003)(305945005)(25786009)(6506007)(102836004)(54906003)(76176011)(81166006)(81156014)(316002)(5640700003)(14444005)(256004)(71190400001)(478600001)(99286004)(52116002)(53936002)(8676002)(2351001)(5660300002)(14454004)(66476007)(66556008)(66946007)(2501003)(66446008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2401;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SzEr+0n/pcum8ou9fCTCv2AlPvjLgKKMH8QvK1ky+dOgM52ope0PhRz/Y2GRmSp9C4Cbw1wN9OqMejbyKzzta2KPdI66vEM83CFefHdL3L1DlDprK3B7wiTYVpN786Yjly6q2ydmL/raIKGuEcFUzbx6QZ9627PzMokriAKyMuRePa5bgci4bjzgxzR/eOwDpKP4MdpQUG1Z/K/xx0ypG4LwcK58a9mTTnQ2SAPrlTGd8ndHkCOqhqhXs3j2O70wBJBIROL+0nxo2O8S6IRggUkIyrViLuCJgNw9W7xAIMHnlDbijiSXD9UNc490/lX4TOBE3tgEezLJFz8VS7/S1ptBysTyggHhCabTlTcbG0WZqcNbFjStn+3IC8w1HL65M9sKMdVzG3AXdBUVfU9IMOajfdrOSbaCJ5P5oHiM9wA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7803d97-c388-4546-fd42-08d71c811aec
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 04:21:52.6521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6w8PyezLACMFTRH1pqreWUvmIVTTCd6porj3wpdJmF8u5DQvre3jfqJ2j7Dyk06
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2401
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vtl6kxDSdLB6tq9Byqmof8rP+JeITGYW5QantiYHWc=;
 b=JILftmoQjys2n5lBddmPQD4EG5YI3N8hw5c7MYAMk0scQBbP3GIs2TVanmjWIx7PoHsJSk0PlaSDPueD/2gPVszIS040mutLbBMaGkKs94H4IqY+WlHiV/1EtwYcxsjoT/7ctopy1lib4RErKcM62FrNwkvgTEUbPzhVeNC06+4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2FsbGluZyBhbWRncHUgZnVuY3Rpb24gdG8gaW52YWxpZGF0ZSBUTEIsIGluc3RlYWQgb2YgdXNp
bmcgYQprZmQgaW1wbGVtZW50YXRpb24uIERlbGV0ZSB0aGUga2ZkIGxvY2FsIFRMQiBpbnZhbGlk
YXRpb24KaW1wbGVtZW50YXRpb24uCgpDaGFuZ2UtSWQ6IElhMTZmY2Y5MDkxYTkzYjhjMGFjZGFm
OTk4MWY4YTVhMWY5YTVjYTFkClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Yx
MC5jIHwgNDEgKystLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYwppbmRleCAzOWZmYjA3Li4zYWZmMmI1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAu
YwpAQCAtODAyLDQyICs4MDIsNiBAQCBzdGF0aWMgdWludDE2X3QgZ2V0X2F0Y192bWlkX3Bhc2lk
X21hcHBpbmdfcGFzaWQoc3RydWN0IGtnZF9kZXYgKmtnZCwKIAlyZXR1cm4gcmVnICYgQVRDX1ZN
SUQwX1BBU0lEX01BUFBJTkdfX1BBU0lEX01BU0s7CiB9CiAKLXN0YXRpYyB2b2lkIHdyaXRlX3Zt
aWRfaW52YWxpZGF0ZV9yZXF1ZXN0KHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQ4X3Qgdm1pZCkK
LXsKLQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
KSBrZ2Q7Ci0JdWludDMyX3QgcmVxID0gKDEgPDwgdm1pZCkgfAotCQkoMCA8PCBHQ1ZNX0lOVkFM
SURBVEVfRU5HMF9SRVFfX0ZMVVNIX1RZUEVfX1NISUZUKSB8LyogbGVnYWN5ICovCi0JCUdDVk1f
SU5WQUxJREFURV9FTkcwX1JFUV9fSU5WQUxJREFURV9MMl9QVEVTX01BU0sgfAotCQlHQ1ZNX0lO
VkFMSURBVEVfRU5HMF9SRVFfX0lOVkFMSURBVEVfTDJfUERFMF9NQVNLIHwKLQkJR0NWTV9JTlZB
TElEQVRFX0VORzBfUkVRX19JTlZBTElEQVRFX0wyX1BERTFfTUFTSyB8Ci0JCUdDVk1fSU5WQUxJ
REFURV9FTkcwX1JFUV9fSU5WQUxJREFURV9MMl9QREUyX01BU0sgfAotCQlHQ1ZNX0lOVkFMSURB
VEVfRU5HMF9SRVFfX0lOVkFMSURBVEVfTDFfUFRFU19NQVNLOwotCi0JbXV0ZXhfbG9jaygmYWRl
di0+c3JibV9tdXRleCk7Ci0KLQkvKiBVc2UgbGlnaHQgd2VpZ2h0IGludmFsaWRhdGlvbi4KLQkg
KgotCSAqIFRPRE8gMTogYWdyZWUgb24gdGhlIHJpZ2h0IHNldCBvZiBpbnZhbGlkYXRpb24gcmVn
aXN0ZXJzIGZvcgotCSAqIEtGRCB1c2UuIFVzZSB0aGUgbGFzdCBvbmUgZm9yIG5vdy4gSW52YWxp
ZGF0ZSBvbmx5IEdDSFVCIGFzCi0JICogU0RNQSBpcyBub3cgbW92ZWQgdG8gR0NIVUIKLQkgKgot
CSAqIFRPRE8gMjogc3VwcG9ydCByYW5nZS1iYXNlZCBpbnZhbGlkYXRpb24sIHJlcXVpcmVzIGtm
ZzJrZ2QKLQkgKiBpbnRlcmZhY2UgY2hhbmdlCi0JICovCi0JV1JFRzMyKFNPQzE1X1JFR19PRkZT
RVQoR0MsIDAsIG1tR0NWTV9JTlZBTElEQVRFX0VORzBfQUREUl9SQU5HRV9MTzMyKSwKLQkJCQkw
eGZmZmZmZmZmKTsKLQlXUkVHMzIoU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HQ1ZNX0lOVkFM
SURBVEVfRU5HMF9BRERSX1JBTkdFX0hJMzIpLAotCQkJCTB4MDAwMDAwMWYpOwotCi0JV1JFRzMy
KFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0NWTV9JTlZBTElEQVRFX0VORzBfUkVRKSwgcmVx
KTsKLQotCXdoaWxlICghKFJSRUczMihTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdDVk1fSU5W
QUxJREFURV9FTkcwX0FDSykpICYKLQkJCQkJKDEgPDwgdm1pZCkpKQotCQljcHVfcmVsYXgoKTsK
LQotCW11dGV4X3VubG9jaygmYWRldi0+c3JibV9tdXRleCk7Ci19Ci0KIHN0YXRpYyBpbnQgaW52
YWxpZGF0ZV90bGJzX3dpdGhfa2lxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MTZf
dCBwYXNpZCkKIHsKIAlzaWduZWQgbG9uZyByOwpAQCAtODc4LDcgKzg0Miw4IEBAIHN0YXRpYyBp
bnQgaW52YWxpZGF0ZV90bGJzKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQxNl90IHBhc2lkKQog
CQlpZiAoZ2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfdmFsaWQoa2dkLCB2bWlkKSkgewogCQkJ
aWYgKGdldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5nX3Bhc2lkKGtnZCwgdm1pZCkKIAkJCQk9PSBw
YXNpZCkgewotCQkJCXdyaXRlX3ZtaWRfaW52YWxpZGF0ZV9yZXF1ZXN0KGtnZCwgdm1pZCk7CisJ
CQkJYW1kZ3B1X2dtY19mbHVzaF9ncHVfdGxiKGFkZXYsIHZtaWQsCisJCQkJCQlBTURHUFVfR0ZY
SFVCXzAsIDApOwogCQkJCWJyZWFrOwogCQkJfQogCQl9CkBAIC04OTYsNyArODYxLDcgQEAgc3Rh
dGljIGludCBpbnZhbGlkYXRlX3RsYnNfdm1pZChzdHJ1Y3Qga2dkX2RldiAqa2dkLCB1aW50MTZf
dCB2bWlkKQogCQlyZXR1cm4gMDsKIAl9CiAKLQl3cml0ZV92bWlkX2ludmFsaWRhdGVfcmVxdWVz
dChrZ2QsIHZtaWQpOworCWFtZGdwdV9nbWNfZmx1c2hfZ3B1X3RsYihhZGV2LCB2bWlkLCBBTURH
UFVfR0ZYSFVCXzAsIDApOwogCXJldHVybiAwOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
