Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83788DA2D0
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 02:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30856E9E2;
	Thu, 17 Oct 2019 00:49:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690055.outbound.protection.outlook.com [40.107.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757C06E9E2
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 00:49:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmmy+rg4g4snz4Na5NrxOGRwLvZEsRzbFG6QyZ9a3yVSQh4Vb2CEi8PvITN11vOf51n2qvePVX3beptJIaKBCQNxJ33FCsEckGnJ4uLo5KKPwhL0Rs9tPq8EcFDBC11CY9YC8DtJ6h7+O9YHamDH8pozM/RQuIRzolGA1QAD8lHD52SC1PlaMKN3mVsiuzaYwC3stlQSPfqDl1dAleAdjOw+rXevkic9baZccC2ctREBIVHaDgh+BlAs5qBvqt+vRvblbABSRbhzh9JgUDlShM2b8f9UT/ZkrKUJz9AxZwfcCWz6TEXs4MToFU0T5ELOMFtLeq5tkzNhmFhBfrkbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FaigV9Kr9VirgigtnutFwpOmMAdY1c1+NQ9KitsMC8=;
 b=DsEdvP6naPdJZix0PmrpW6FnxfrIpKaI49SQISmguM347aNzrd7k++W/nbG4a+6Qnodld5u15VYp2nu+O7IwwIW9GaIGEHqEcMTUQvr6kLUt9J/i4n6h6zFzZWS33audVO6OI7Bzqg5rrzBgwitx4RnMXkAZ1hnd6aXVdJ5oNZjBidUXVn1WENhGBQIwZoakYMHQeooHaTCPG1zQzYKX19RMo4tvVPhIXHrkAE17+sCZ3H6cslLUGnUHEmcqcqoUx2E4FyPk7ufZtB1V51+DK6ZRMGisMUihBdGe8cqIAaNnFmDK1e6NGQmq+CEnGw+eyUugIPz+dFXZulQ5NTPXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB4231.namprd12.prod.outlook.com (20.180.17.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Thu, 17 Oct 2019 00:49:05 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::911:107a:8757:3994%3]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 00:49:05 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Topic: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Index: AQHVhISs0+WbYrMUA0mDJHHtV//DAg==
Date: Thu, 17 Oct 2019 00:49:04 +0000
Message-ID: <20191017004852.6230-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::44) To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb03d2cd-36db-4646-62d2-08d7529bcf42
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CH2PR12MB4231:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB42317484096943737B0DE476856D0@CH2PR12MB4231.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(199004)(189003)(2351001)(6486002)(14454004)(26005)(14444005)(1076003)(66446008)(86362001)(186003)(5660300002)(2906002)(102836004)(3846002)(5640700003)(6116002)(99286004)(71190400001)(36756003)(71200400001)(52116002)(66556008)(478600001)(64756008)(256004)(66476007)(386003)(6436002)(4326008)(6512007)(6916009)(66946007)(2616005)(25786009)(316002)(6506007)(8676002)(476003)(486006)(81156014)(305945005)(81166006)(7736002)(54906003)(8936002)(50226002)(66066001)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4231;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3nHZRi3yao3QUJc3C5xA1OXkNNxtyqQzrXYvO+i+gTm+zr3d0PPQcOQdga0LNNdkVOj3G4u/OKqI1iRbPzFnOw08PJ/QQPPPOOCa7a6XhUUnPp3AgQa1+rNF5kbjKzcmQyqO5FBjY/Z1TWVCzQsM6NsyaDI3oJuCtvB0MhLfHzBeW8B4s1adYCcxnv1/BUaEoT4TJb4zReP4iOyapom2kEphHTWKR5WruvmFYn6RCrTDdVjkU8HjmqmwIRpXRwJkTJ5ec+62izBKVN0U8nxambsI/vgvBGizEvhMEnSXLTRcbAQbPjDplzk5GqIMdSoO1o4h7Q9Yr3+ZhSerMtnNmXkWSdwdTb06FSZwLeae4rZ8MDBFmTbRWKNZZJpRKuJ+jiDwDOW8Ci/z9MP5kcyb1qgQfHIDoj0PQWDh9dfF6do=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb03d2cd-36db-4646-62d2-08d7529bcf42
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 00:49:05.0125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pHqcBEqGOz8GrtmYkPpvYQHuEICoc5NfCRyRqC29Oo68to6ICS+Wr6QZJPWrVAm2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FaigV9Kr9VirgigtnutFwpOmMAdY1c1+NQ9KitsMC8=;
 b=bOpGbwRWJ1aZbL2xE61uui+vMQ2jtc37jnX/5LxjpPJ1CDIOPg3pEBFAxZSnTUN8fESzP4oFrd7DzyIS5Yqup3UHnzUABHi1l3adHJS5dpnkvsZbqsUM8RNWUaR/Xl0b0lPdpYpriPQFzr2nXBE+IImAGNmiqjuvzDyJs1qvuLU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Felix.Keuhling@amd.com" <Felix.Keuhling@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVhZCBvciB3cml0ZXMgdG8gZGYgcmVnaXN0ZXJzIHdoZW4gZ3B1IGRmIGlzIGluIGMtc3RhdGVz
IHdpbGwgcmVzdWx0IGluCmhhbmcuICBkZiBjLXN0YXRlcyBzaG91bGQgYmUgZGlzYWJsZWQgcHJp
b3IgdG8gcmVhZCBvciB3cml0ZXMgdGhlbgpyZS1lbmFibGVkIGFmdGVyIHJlYWQgb3Igd3JpdGVz
LgoKQ2hhbmdlLUlkOiBJNmQ1YTgzZTRmZTEzZTI5YzczZGZiMDNhOTRmZTdjNjExZTg2N2ZlYwpT
aWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPEpvbmF0aGFuLktpbUBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDIxICsrKysrKysrKysrKysrKysr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKaW5kZXggMTZmYmQyYmM4YWQxLi45YTU4NDE2
NjYyZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKQEAgLTEwMiw2ICsxMDIs
OSBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRfZmljYShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zm
c2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNl
dChhZGV2KTsKIAorCWlmIChzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCAwKSkKKwkJcmV0
dXJuIDB4RkZGRkZGRkZGRkZGRkZGRjsKKwogCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2ll
X2lkeF9sb2NrLCBmbGFncyk7CiAJV1JFRzMyKGFkZHJlc3MsIHNtbkRGX1BJRV9BT05fRmFicmlj
SW5kaXJlY3RDb25maWdBY2Nlc3NBZGRyZXNzMyk7CiAJV1JFRzMyKGRhdGEsIGZpY2FhX3ZhbCk7
CkBAIC0xMTQsNiArMTE3LDggQEAgc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2
LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7CiAKKwlzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211
LCAxKTsKKwogCXJldHVybiAoKChmaWNhZGhfdmFsICYgMHhGRkZGRkZGRkZGRkZGRkZGKSA8PCAz
MikgfCBmaWNhZGxfdmFsKTsKIH0KIApAQCAtMTI1LDYgKzEzMCw5IEBAIHN0YXRpYyB2b2lkIGRm
X3YzXzZfc2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZpY2Fh
X3ZhbCwKIAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0
KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChh
ZGV2KTsKIAorCWlmIChzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCAwKSkKKwkJcmV0dXJu
OworCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKIAlX
UkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJyaWNJbmRpcmVjdENvbmZpZ0FjY2Vzc0Fk
ZHJlc3MzKTsKIAlXUkVHMzIoZGF0YSwgZmljYWFfdmFsKTsKQEAgLTEzNCw4ICsxNDIsOSBAQCBz
dGF0aWMgdm9pZCBkZl92M182X3NldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
aW50MzJfdCBmaWNhYV92YWwsCiAKIAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJy
aWNJbmRpcmVjdENvbmZpZ0FjY2Vzc0RhdGFIaTMpOwogCVdSRUczMihkYXRhLCBmaWNhZGhfdmFs
KTsKLQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdz
KTsKKworCXNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDEpOwogfQogCiAvKgpAQCAtMTUz
LDEyICsxNjIsMTcgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9wZXJmbW9uX3JyZWcoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJYWRkcmVzcyA9IGFkZXYtPm5iaW8uZnVuY3MtPmdldF9wY2ll
X2luZGV4X29mZnNldChhZGV2KTsKIAlkYXRhID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVf
ZGF0YV9vZmZzZXQoYWRldik7CiAKKwlpZiAoc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwg
MCkpCisJCXJldHVybjsKKwogCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5wY2llX2lkeF9sb2Nr
LCBmbGFncyk7CiAJV1JFRzMyKGFkZHJlc3MsIGxvX2FkZHIpOwogCSpsb192YWwgPSBSUkVHMzIo
ZGF0YSk7CiAJV1JFRzMyKGFkZHJlc3MsIGhpX2FkZHIpOwogCSpoaV92YWwgPSBSUkVHMzIoZGF0
YSk7CiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3Mp
OworCisJc211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgMSk7CiB9CiAKIC8qCkBAIC0xNzUs
MTIgKzE4OSwxNyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BlcmZtb25fd3JlZyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgbG9fYWRkciwKIAlhZGRyZXNzID0gYWRldi0+bmJp
by5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYpOwogCWRhdGEgPSBhZGV2LT5uYmlv
LmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsKIAorCWlmIChzbXVfc2V0X2RmX2Nz
dGF0ZSgmYWRldi0+c211LCAwKSkKKwkJcmV0dXJuOworCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFk
ZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsKIAlXUkVHMzIoYWRkcmVzcywgbG9fYWRkcik7CiAJ
V1JFRzMyKGRhdGEsIGxvX3ZhbCk7CiAJV1JFRzMyKGFkZHJlc3MsIGhpX2FkZHIpOwogCVdSRUcz
MihkYXRhLCBoaV92YWwpOwogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4
X2xvY2ssIGZsYWdzKTsKKworCXNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDEpOwogfQog
CiAvKiBnZXQgdGhlIG51bWJlciBvZiBkZiBjb3VudGVycyBhdmFpbGFibGUgKi8KLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
