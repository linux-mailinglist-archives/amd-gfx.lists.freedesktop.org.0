Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23A4AE8F1
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 13:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A496E02E;
	Tue, 10 Sep 2019 11:17:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710067.outbound.protection.outlook.com [40.107.71.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265596E02E
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 11:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTNGcJZegb3lHLb1spaNZjxrsIIzlOsNDpIZfnAF0b3Pvm+h/NKhCFyt1iUTwqHKcIdX050cs/z2AhlQkm/AAev9t2W9TFJ+lQv2YGKAz77v6SW84X8tD5o5OYTQxLAp0p2TtwBOB76M2Y5l/KT1FuKmx0c5F5TQy/P6NT3YI00f8ooSfVxsfuYzGCxtwXqyFI8sUJkqOVV/+UW7BhGX1velFcHDXSnr7TYueYC17BOiPYgB+t+ii/tG49M/1/7ovbYQJHrt7diateKjncl0CZAiAD0ziSIopg8eifNNtz5mOq+dd4s3fy4GS5A2MEiTtMSHSgxHQ7g49jYQ0Mw25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro16PGinSfr82xkZ/khmlQH0xACxyNbxBK0M1WeTPxg=;
 b=EPxaoMYj5tJwQC/CrybsqjbgxoEu7WxiNcKpIWL3xWQCFLffwpeLM7BCK+qNGrpcwhhf7cVzCDBERqgVyDQyJ+lfhBMu5how+msgBktcRT2HpatfzQOwS+RJh2bZf6W3JSmdEQwY7Z4hP3hPg5GKrWgasTkIugmzBw28jZHbs672676C9rtpeoqR08m54pVypnrq4XgwvZca0gR3h0/XL7MGpu6izXehCtt3qzbeP234HT8m7oIJxJ64vUNS6d9jlCJJHToOEMFLivQf9r/hNWeKevFJnodZN/vhqHZNjBXxONmOP4wgomIuDfZPttVaSctZTjR75GjhM6676Ud6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3854.namprd12.prod.outlook.com (10.255.237.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 11:17:27 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 11:17:27 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: fix the missed asic name while inited
 renoir_device_info
Thread-Topic: [PATCH] drm/amdkfd: fix the missed asic name while inited
 renoir_device_info
Thread-Index: AQHVZ8lTscDW+F8N50axIOWVwQVoAg==
Date: Tue, 10 Sep 2019 11:17:27 +0000
Message-ID: <1568114232-28889-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:202:2e::26) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c94859f1-563c-4c4b-d057-08d735e07635
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3854; 
x-ms-traffictypediagnostic: MN2PR12MB3854:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3854B96F48CC6DAA037E2BF6ECB60@MN2PR12MB3854.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(189003)(199004)(71200400001)(99286004)(8676002)(4326008)(2616005)(52116002)(256004)(54906003)(476003)(14444005)(305945005)(316002)(486006)(186003)(7736002)(6486002)(26005)(53936002)(81166006)(6506007)(386003)(81156014)(2501003)(36756003)(2351001)(50226002)(6436002)(5640700003)(2906002)(71190400001)(8936002)(14454004)(66446008)(66066001)(6916009)(6512007)(6116002)(66946007)(66476007)(66556008)(25786009)(64756008)(5660300002)(3846002)(478600001)(102836004)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3854;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vLeLo454RQ5fy+MF8nPWd+V/3SNLtdFjNGcehkWO9501EvAlkJgj9qlDQafucVHEeA7tMdM8zGTP2dhElL1g0mnPzWChQdEzyZcARhBepPqAeLEbXDA9YxVL7Bn/nA1lyiRUCjdTEFU8aL2yIlx9sQOTmP6Ts6OtJlZMPv4Ru/mWVb8q0zy3Ortk1J4iz3wpEGIUW1uAevqkXSi8TcdzyGSzLqDFYIJmFuESBi+slO3k8BGDL3I9zgeiicBMiX0Yg95GtoSj/81+cLg2YpemU0w5whYSCTZ3U+pbZdURAqHT+7oC69MGwqusfRZjqEFwGOlmYGPIzzu/Ai9itbD3HBGfaUe9I2aPAFrN6kotECLpLbwch106vfWcACpbcs6VrSy0K9o8N3B8aZQBqySnFXPIVCBFlYE7Y568PqIuQRE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94859f1-563c-4c4b-d057-08d735e07635
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 11:17:27.1627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +P0LY6dfqGQlcIwYxSLWzWVDrko8csHrr+7HudsztH/rJJjO7wzPdiETG/hm9+qrRzPBUrsumRZ5E5iItF/TKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3854
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro16PGinSfr82xkZ/khmlQH0xACxyNbxBK0M1WeTPxg=;
 b=fVyXOaag8XayLiK/re7Yy7+2M6xeE79mhd3Dj4YohsUbOxcpITGf+ZOz4HwvpWbd+WUhl37E86ghmVswJubgQUpqiAJQVQ+/GOAdzoybVX2aD+FwevKpvYVsnVCs+Jr9IL83wgzBjA6v6N1ryl/hC7y7yK8dFwintSkVMDbxZEs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXhlcyBudWxsIHBvaW50ZXIgaXNzdWUgYmVsb3csIEkgbWlzc2VkIHRvIGlu
aXQgdGhlIGFzaWMgcmVuaW9yIG5hbWUKd2hpbGUgSSByZWJhc2UgdGhlIHBhdGNoZXMuCgpbICAx
MDYuMDA0MjUwXSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UsIGFkZHJlc3M6
IDAwMDAwMDAwMDAwMDAwMDAKWyAgMTA2LjAwNDI1NF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNj
ZXNzIGluIGtlcm5lbCBtb2RlClsgIDEwNi4wMDQyNTZdICNQRjogZXJyb3JfY29kZSgweDAwMDAp
IC0gbm90LXByZXNlbnQgcGFnZQpbICAxMDYuMDA0MjU3XSBQR0QgMCBQNEQgMApbICAxMDYuMDA0
MjYxXSBPb3BzOiAwMDAwIFsjMV0gU01QIE5PUFRJClsgIDEwNi4wMDQyNjRdIENQVTogMyBQSUQ6
IDE0MjIgQ29tbTogbW9kcHJvYmUgTm90IHRhaW50ZWQgNS4yLjAtcmMxLWN1c3RvbSAjMQpbICAx
MDYuMDA0MjY2XSBIYXJkd2FyZSBuYW1lOiBBTUQgQ2VsYWRvbi1STi9DZWxhZG9uLVJOLCBCSU9T
CldDRDk4MTROX1dlZWtseV8xOV8wOF8xIDA4LzE0LzIwMTkKWyAgMTA2LjAwNDI3Ml0gUklQOiAw
MDEwOnN0cm5jcHkrMHgxMi8weDMwClsgIDEwNi4wMDQyNzRdIENvZGU6IGMxIGMwIDExIDQ4IGMx
IGM2IDE1IDQ4IDMxIGQwIDQ4IGMxIGMyIDIwIDMxIGMyIDg5IGQwIDMxIGYwCjQxIDVjIDVkIGMz
IDU1IDQ4IDg1IGQyIDQ4IDg5IGY4IDQ4IDg5IGU1IDc0IDFlIDQ4IDAxIGZhIDQ4IDg5IGY5IDw0
ND4gMGYgYjYgMDYKNDEgODAgZjggMDEgNDQgODggMDEgNDggODMgZGUgZmYgNDggODMgYzEgMDEg
NDggMzkgZDEKWyAgMTA2LjAwNDI3OF0gUlNQOiAwMDE4OmZmZmZjMDkyYzFmZDM3YTggRUZMQUdT
OiAwMDAxMDI4NgpbICAxMDYuMDA0MjgxXSBSQVg6IGZmZmY5ZTk0MzQ2NmEyOGMgUkJYOiAwMDAw
MDAwMDAwMDAzNmVkIFJDWDogZmZmZjllOTQzNDY2YTI4YwpbICAxMDYuMDA0MjgzXSBSRFg6IGZm
ZmY5ZTk0MzQ2NmEyYWMgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogZmZmZjllOTQzNDY2YTI4
YwpbICAxMDYuMDA0Mjg1XSBSQlA6IGZmZmZjMDkyYzFmZDM3YTggUjA4OiBmZmZmOWU5NDNkMTAw
MDAwIFIwOTogMDAwMDAwMDAwMDAwMDIyOApbICAxMDYuMDA0Mjg3XSBSMTA6IGZmZmY5ZTk0NDE4
ZGM1YTggUjExOiBmZmZmOWU5NDQ3NDZjMGQwIFIxMjogMDAwMDAwMDAwMDAwMDAwMApbICAxMDYu
MDA0Mjg5XSBSMTM6IGZmZmY5ZTk0M2ZhMWVjMDAgUjE0OiBmZmZmOWU5NDM0NjZhMjAwIFIxNTog
ZmZmZjllOTQzNDY2YTIwMApbICAxMDYuMDA0MjkxXSBGUzogIDAwMDA3ZjdhMDIyYzU1NDAoMDAw
MCkgR1M6ZmZmZjllOTQ0N2FjMDAwMCgwMDAwKQprbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgIDEw
Ni4wMDQyOTRdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAw
MzMKWyAgMTA2LjAwNDI5Nl0gQ1IyOiAwMDAwMDAwMDAwMDAwMDAwIENSMzogMDAwMDAwMDFmZjBi
MDAwMCBDUjQ6IDAwMDAwMDAwMDAzNDBlZTAKWyAgMTA2LjAwNDI5OF0gQ2FsbCBUcmFjZToKWyAg
MTA2LjAwNDM4Ml0gIGtmZF90b3BvbG9neV9hZGRfZGV2aWNlKzB4MTUwLzB4NjEwIFthbWRncHVd
ClsgIDEwNi4wMDQ0NDVdICBrZ2Qya2ZkX2RldmljZV9pbml0KzB4MmUwLzB4NGYwIFthbWRncHVd
ClsgIDEwNi4wMDQ1MDldICBhbWRncHVfYW1ka2ZkX2RldmljZV9pbml0KzB4MTRjLzB4MWIwIFth
bWRncHVdCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jCmluZGV4IGEyZmUwY2IuLmYzMjliODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlLmMKQEAgLTM1Myw2ICszNTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9k
ZXZpY2VfaW5mbyBhcmN0dXJ1c19kZXZpY2VfaW5mbyA9IHsKIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBrZmRfZGV2aWNlX2luZm8gcmVub2lyX2RldmljZV9pbmZvID0gewogCS5hc2ljX2ZhbWlseSA9
IENISVBfUkVOT0lSLAorCS5hc2ljX25hbWUgPSAicmVub2lyIiwKIAkubWF4X3Bhc2lkX2JpdHMg
PSAxNiwKIAkubWF4X25vX29mX2hxZCAgPSAyNCwKIAkuZG9vcmJlbGxfc2l6ZSAgPSA4LAotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
