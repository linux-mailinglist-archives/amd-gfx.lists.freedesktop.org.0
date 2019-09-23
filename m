Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466F1BAD4E
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 06:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3DC6E0DD;
	Mon, 23 Sep 2019 04:30:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141176E060
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 04:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw3z9UYsuJxDmWELMWSlBbnkW2bzmpw2D2LvnLBwjfE6Bblwy0Gqa6ADjLZJ2NaTPdTwtp9Eb79ioMHkCozmtu6Ajv5nulTC6rwai1J0KjtLxKLmzfZUm2WOIBR+GJE8aigqIKhLHjgwt9Zdr+dGxx5HsiyRA0JKg04YTAJyto5PT4d88Z+44NumjQkTsM18i3xwBDth4lED/J4m4TZXlWFcA2U7zuKAk1+LcByrrXdIypAszf8JH/uRRWwaueqsy6Rni4IIsrIkWJD84KKrzSofIr/boOnZYfohskbfgTxZRMSsdveP5ZCNWjmFSpZVa4nU7xIvzucUdoVKQdTkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvANkpxyhpCogZXeRDDRuSOEuchoOs0MHhdmJsiUico=;
 b=e0mwTIWC6EmDHJ7ke3mUMTIaT4wNFZL+ZsHWi4Dl2PhS2zhTML4QTzqUAuonfZX2jUOyEkQVlgAmNZpe1vg0HCQLnpFvlbwaLnjsGZl6LPDKynqkwYdg3jDiQcRrXcHjfEuJOvXLsHzDrA/lE2cc3ny65efRsME+XmHO2yjd5M4ECT6EbKwom2DL2HSj5FtM8/IGEktakmrNHunJ259OwKm8NC6WTX/v1N08WnU8JUvHMPWfrbJhmbio3WB45IHXic8Uv1jhnlY/2R7rlN3WUCXbm8YegPVPVoYF+PW3J/TdQdAOjJl/wljH3tjBApNNIp/7ZKgdgR2pUeF12wxFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB4186.namprd12.prod.outlook.com (10.141.186.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Mon, 23 Sep 2019 04:29:58 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 04:29:58 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdkfd: Remove excessive print when reserving
 doorbells
Thread-Topic: [PATCH 2/3] drm/amdkfd: Remove excessive print when reserving
 doorbells
Thread-Index: AQHVcceO1bMAQvOnR0axa2C9uaoh7w==
Date: Mon, 23 Sep 2019 04:29:58 +0000
Message-ID: <20190923042944.15314-2-Yong.Zhao@amd.com>
References: <20190923042944.15314-1-Yong.Zhao@amd.com>
In-Reply-To: <20190923042944.15314-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0a0372d-05f7-4f85-a965-08d73fdeb14c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4186; 
x-ms-traffictypediagnostic: DM6PR12MB4186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4186E73A6FBA625EEED12422F0850@DM6PR12MB4186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:335;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(66476007)(64756008)(66556008)(66446008)(5660300002)(386003)(8936002)(66946007)(81156014)(476003)(2616005)(11346002)(1076003)(316002)(86362001)(81166006)(6506007)(6916009)(2501003)(66066001)(2906002)(71200400001)(71190400001)(446003)(305945005)(7736002)(14454004)(478600001)(186003)(25786009)(99286004)(50226002)(6116002)(256004)(36756003)(3846002)(6512007)(52116002)(26005)(4326008)(76176011)(8676002)(5640700003)(102836004)(6436002)(2351001)(6486002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4186;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tV8OpyhoeNatli7B9Kvg6qYhh2prSsHizsnMxXsYIdvm7l4prtQ9cNybUEu3FaADuRZsJ2+8vL50xIjFcQZZ7rN2KiPDS7mfSNzxryAxfxnFRN09L8qiknM3AwbTpM85HAqj4enw7X1pO62Kyzd7Aj/Ltc3rxxhxZDlgploS+mswzR2n6vGkIs1IAditbNnbfQdhdPKR52Zu7t1Im3p72eYIDRAfudbTgztdUhvIjtI+eHF/TK51c1xzVqNso1z1BYGFdGfp2hsloa5Tw8q3u0fkv0kVFniVHkjq18xhxkNFv1qMy661Q2nnyrXqE2Txnqot1ucY2VZf8gnwkQQEPAcdUWrlSOtTTyb2D0Sy5lZ7m6/mCwliDjaqOxAaFHrsFxvv6UcvcfMXcI5sfyVEaeJ0zyaQT3UVZNiG63WVE0s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a0372d-05f7-4f85-a965-08d73fdeb14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 04:29:58.7704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWGGEqv43LME76HGS9UV3TLchMKVW2x0jkCp/l7qajeHlBlX5Kq3RDicepVZrBN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvANkpxyhpCogZXeRDDRuSOEuchoOs0MHhdmJsiUico=;
 b=NwY5Mb4qro9sYblq3Ea3fZdvh5IzDOWDDx5Q+cZvefoIwMil7uICiEhzvybKnl0LQKp6YolJuR7D3gTcWNcwHvWKpSGMMwY202J9qjePGQEBQevQrtHeZAwHT6ZXy7SBh6PO6HByGOXR26qS1Eif0aWWBTORofeyhp2kVmpo3LU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGRvemVucyBvZiBwcmludGluZyBtZXNzYWdlcyBhcmUgY29tcHJlc3NlZCBpbnRvIDIgbGlu
ZXMuCgpDaGFuZ2UtSWQ6IEkzMzliM2VlZTA2NTA5OTczZjc2NTc3MDkxYzRjNGU5YzcwZWQ4MjQ4
ClNpZ25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyB8IDEyICsrKysrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwppbmRleCAwYzZhYzA0M2FlM2MuLjQ4YTM4ODQ3
ZTgzOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3Mu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCkBAIC02OTMs
NiArNjkzLDggQEAgc3RhdGljIGludCBpbml0X2Rvb3JiZWxsX2JpdG1hcChzdHJ1Y3QgcWNtX3By
b2Nlc3NfZGV2aWNlICpxcGQsCiAJCQlzdHJ1Y3Qga2ZkX2RldiAqZGV2KQogewogCXVuc2lnbmVk
IGludCBpOworCWludCByYW5nZV9zdGFydCA9IGRldi0+c2hhcmVkX3Jlc291cmNlcy5ub25fY3Bf
ZG9vcmJlbGxzX3N0YXJ0OworCWludCByYW5nZV9lbmQgPSBkZXYtPnNoYXJlZF9yZXNvdXJjZXMu
bm9uX2NwX2Rvb3JiZWxsc19lbmQ7CiAKIAlpZiAoIUtGRF9JU19TT0MxNShkZXYtPmRldmljZV9p
bmZvLT5hc2ljX2ZhbWlseSkpCiAJCXJldHVybiAwOwpAQCAtNzA0LDE0ICs3MDYsMTYgQEAgc3Rh
dGljIGludCBpbml0X2Rvb3JiZWxsX2JpdG1hcChzdHJ1Y3QgcWNtX3Byb2Nlc3NfZGV2aWNlICpx
cGQsCiAJCXJldHVybiAtRU5PTUVNOwogCiAJLyogTWFzayBvdXQgZG9vcmJlbGxzIHJlc2VydmVk
IGZvciBTRE1BLCBJSCwgYW5kIFZDTiBvbiBTT0MxNS4gKi8KKwlwcl9kZWJ1ZygicmVzZXJ2ZWQg
ZG9vcmJlbGwgMHglMDN4IC0gMHglMDN4XG4iLCByYW5nZV9zdGFydCwgcmFuZ2VfZW5kKTsKKwlw
cl9kZWJ1ZygicmVzZXJ2ZWQgZG9vcmJlbGwgMHglMDN4IC0gMHglMDN4XG4iLAorCQkJcmFuZ2Vf
c3RhcnQgKyBLRkRfUVVFVUVfRE9PUkJFTExfTUlSUk9SX09GRlNFVCwKKwkJCXJhbmdlX2VuZCAr
IEtGRF9RVUVVRV9ET09SQkVMTF9NSVJST1JfT0ZGU0VUKTsKKwogCWZvciAoaSA9IDA7IGkgPCBL
RkRfTUFYX05VTV9PRl9RVUVVRVNfUEVSX1BST0NFU1MgLyAyOyBpKyspIHsKLQkJaWYgKGkgPj0g
ZGV2LT5zaGFyZWRfcmVzb3VyY2VzLm5vbl9jcF9kb29yYmVsbHNfc3RhcnQKLQkJCSYmIGkgPD0g
ZGV2LT5zaGFyZWRfcmVzb3VyY2VzLm5vbl9jcF9kb29yYmVsbHNfZW5kKSB7CisJCWlmIChpID49
IHJhbmdlX3N0YXJ0ICYmIGkgPD0gcmFuZ2VfZW5kKSB7CiAJCQlzZXRfYml0KGksIHFwZC0+ZG9v
cmJlbGxfYml0bWFwKTsKIAkJCXNldF9iaXQoaSArIEtGRF9RVUVVRV9ET09SQkVMTF9NSVJST1Jf
T0ZGU0VULAogCQkJCXFwZC0+ZG9vcmJlbGxfYml0bWFwKTsKLQkJCXByX2RlYnVnKCJyZXNlcnZl
ZCBkb29yYmVsbCAweCUwM3ggYW5kIDB4JTAzeFxuIiwgaSwKLQkJCQlpICsgS0ZEX1FVRVVFX0RP
T1JCRUxMX01JUlJPUl9PRkZTRVQpOwogCQl9CiAJfQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
