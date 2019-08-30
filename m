Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE54A2EC1
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 07:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754D589306;
	Fri, 30 Aug 2019 05:15:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6372889307
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 05:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCAj6XxVRYKrGdTadGSFdmk0hlmqeaOI5G49m+5uTmW94ry/2UeKi28ExrhPmSt9KFKtTO//RO8LTEv3Z4AdsJk8Fv6q2ubCVHr3E55oGvQCuiK/OcuYBNnlarJrz0Bd5/qbqio9m9+mpHvPGs4iQFJ1TQpQ8YQWKnjVxT40nH7MSDRn9z1vPJe9YjoNTuDVcwnAIqt7j/YCI37GgTReUeRwn5kV5xWot7IreYQwDiS6jgL4B62dHbWjKsx6PMfdmvbFQcssOSSHvW2cjdwf1FtjYFm8tDtj3bFpcrcY1/HBi1AfOa6u+oPmleZ8ACPLjPwWmrqhXAtHdXbK1l0dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/uzdRnefzwffBnYMmoxKmwZ4ImJj9WlJrOFWOA+BIo=;
 b=oZOn7YfTWcBPjWs2IXPzeynyfOqltzXzTXUbZ7DZJPZ+QdiHKxXQIhcHX9rfI0/gUH3HMAA5rViHlrGlUQ1Utwn85swbn+GoAZNg/30VMlh8yypaSJhej+r0j3tsmD4/Ay75+/cXJUCAXa95LG394oaeedqQZP0K3jr5X0ZPpzfLcytwWxDq/aQ2Ay1QCqMd/dNTD/HRL3fevudkidSWwDYnmyZROb8MFfPgh9gnXfWBN3xRcuC2A8leOFhQatMOA1iSF66fQx/j2wQNuxguk7gnDdkuD18Wrm2etdn7lIhfnPA5Kmj/xDHvH4UcUg6PHnvAi1XICHdKyRfGsu1n8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4220.namprd12.prod.outlook.com (10.141.187.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 05:15:03 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 05:15:03 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Disable page faults while reading user wptrs
Thread-Topic: [PATCH 2/2] drm/amdgpu: Disable page faults while reading user
 wptrs
Thread-Index: AQHVXvHg8yvh357pRUKGp06FxJFc+w==
Date: Fri, 30 Aug 2019 05:15:02 +0000
Message-ID: <20190830051443.3906-2-Felix.Kuehling@amd.com>
References: <20190830051443.3906-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190830051443.3906-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a48169f6-8778-49eb-0317-08d72d090328
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4220; 
x-ms-traffictypediagnostic: DM6PR12MB4220:
x-microsoft-antispam-prvs: <DM6PR12MB4220C374F9B5EFE25248B05A92BD0@DM6PR12MB4220.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39850400004)(346002)(396003)(199004)(189003)(3846002)(14454004)(66476007)(2501003)(99286004)(5640700003)(66556008)(66946007)(2351001)(66446008)(64756008)(2906002)(316002)(25786009)(256004)(14444005)(71190400001)(8936002)(305945005)(6512007)(7736002)(6436002)(50226002)(81166006)(6506007)(8676002)(53936002)(478600001)(52116002)(81156014)(6486002)(186003)(476003)(1076003)(26005)(2616005)(446003)(11346002)(486006)(102836004)(36756003)(86362001)(6916009)(71200400001)(6116002)(66066001)(5660300002)(386003)(76176011)(17423001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4220;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5VYebhxXKZ1JaN8oVXiXu0bkN0isRose9Kk+PjALfzH92dWhsGczRFnsONx0kKkxS88IkO5w2r3BMHuGjLE3PlOJRXckzeTQNJtqjdf175eAulDlhsTmFVw32N0WgrS6WGQTlSjH+0LZSPAgdLRQMc5jLoqIzAY1E4IosKXiBBNvJQDBWe7hckzl8USs8gnMIbyMcQE4Pl4RkNRDYcQToBeYbC1fyjwEnR+TWE69E+ImvIfAXasHxKqGspvFNL2z+39xTO9InV+BkD+55hAChEjv2R6XfrG9NbLedPmWYJhyAjj5/klm88mqDoKdTDGSkEnguBZ0S5gckNI8C6LSUthCDiYHZ3ZziYf6qfibq0Fp3XMhSubMHmj7xDkuUT6c9cbSgxfStJzIfdp+7o+HeaShprpcRkt8spnrZtZOnNU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48169f6-8778-49eb-0317-08d72d090328
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 05:15:03.0871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUb7AaXg1K6xPb2vNki4A5u9wsGaxR2Stjb8WKrifbWkcl9JZUaY+pM1t3RJ7IKzIhiOpNpiokmH3I99fwqDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/uzdRnefzwffBnYMmoxKmwZ4ImJj9WlJrOFWOA+BIo=;
 b=ZYLpC3YVKrKyV7deATg0O/Ocq7zPrbdPh/rPodDkuMvkoqpdWIhswFQKl5dNljiYzv1buv+UI20fQ4TDP5SZGWzN2NG42DEFNVcvLYr0miMOqtwQROy2xCteJ5yY4u9qj4HR3BFGUxhOO2r74tiSd662saNLm4LYK4UXtZhCQQs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2Ugd3B0cnMgbXVzdCBiZSBwaW5uZWQgYW5kIEdQVSBhY2Nlc3NpYmxlIHdoZW4gdGhpcyBp
cyBjYWxsZWQKZnJvbSBocWRfbG9hZCBmdW5jdGlvbnMuIFNvIHRoZXkgc2hvdWxkIG5ldmVyIGZh
dWx0LiBUaGlzIHJlc29sdmVzCmEgY2lyY3VsYXIgbG9jayBkZXBlbmRlbmN5IGlzc3VlIGludm9s
dmluZyBmb3VyIGxvY2tzIGluY2x1ZGluZyB0aGUKRFFNIGxvY2sgYW5kIG1tYXBfc2VtLgoKU2ln
bmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIHwgOCArKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmQuaAppbmRleCAxYWY4ZjgzZjdlMDIuLmMwMDNkOTI3NTgzNyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaApAQCAtMTc5LDEwICsx
NzksMTcgQEAgdWludDY0X3QgYW1kZ3B1X2FtZGtmZF9nZXRfbW1pb19yZW1hcF9waHlzX2FkZHIo
c3RydWN0IGtnZF9kZXYgKmtnZCk7CiB1aW50MzJfdCBhbWRncHVfYW1ka2ZkX2dldF9udW1fZ3dz
KHN0cnVjdCBrZ2RfZGV2ICprZ2QpOwogdWludDhfdCBhbWRncHVfYW1ka2ZkX2dldF94Z21pX2hv
cHNfY291bnQoc3RydWN0IGtnZF9kZXYgKmRzdCwgc3RydWN0IGtnZF9kZXYgKnNyYyk7CiAKKy8q
IFJlYWQgdXNlciB3cHRyIGZyb20gYSBzcGVjaWZpZWQgdXNlciBhZGRyZXNzIHNwYWNlIHdpdGgg
cGFnZSBmYXVsdAorICogZGlzYWJsZWQuIFRoZSBtZW1vcnkgbXVzdCBiZSBwaW5uZWQgYW5kIG1h
cHBlZCB0byB0aGUgaGFyZHdhcmUgd2hlbgorICogdGhpcyBpcyBjYWxsZWQgaW4gaHFkX2xvYWQg
ZnVuY3Rpb25zLCBzbyBpdCBzaG91bGQgbmV2ZXIgZmF1bHQgaW4KKyAqIHRoZSBmaXJzdCBwbGFj
ZS4gVGhpcyByZXNvbHZlcyBhIGNpcmN1bGFyIGxvY2sgZGVwZW5kZW5jeSBpbnZvbHZpbmcKKyAq
IGZvdXIgbG9ja3MsIGluY2x1ZGluZyB0aGUgRFFNIGxvY2sgYW5kIG1tYXBfc2VtLgorICovCiAj
ZGVmaW5lIHJlYWRfdXNlcl93cHRyKG1tcHRyLCB3cHRyLCBkc3QpCQkJCVwKIAkoewkJCQkJCQkJ
XAogCQlib29sIHZhbGlkID0gZmFsc2U7CQkJCQlcCiAJCWlmICgobW1wdHIpICYmICh3cHRyKSkg
ewkJCQlcCisJCQlwYWdlZmF1bHRfZGlzYWJsZSgpOwkJCQlcCiAJCQlpZiAoKG1tcHRyKSA9PSBj
dXJyZW50LT5tbSkgewkJCVwKIAkJCQl2YWxpZCA9ICFnZXRfdXNlcigoZHN0KSwgKHdwdHIpKTsJ
XAogCQkJfSBlbHNlIGlmIChjdXJyZW50LT5tbSA9PSBOVUxMKSB7CQlcCkBAIC0xOTAsNiArMTk3
LDcgQEAgdWludDhfdCBhbWRncHVfYW1ka2ZkX2dldF94Z21pX2hvcHNfY291bnQoc3RydWN0IGtn
ZF9kZXYgKmRzdCwgc3RydWN0IGtnZF9kZXYgKnMKIAkJCQl2YWxpZCA9ICFnZXRfdXNlcigoZHN0
KSwgKHdwdHIpKTsJXAogCQkJCXVudXNlX21tKG1tcHRyKTsJCQlcCiAJCQl9CQkJCQkJXAorCQkJ
cGFnZWZhdWx0X2VuYWJsZSgpOwkJCQlcCiAJCX0JCQkJCQkJXAogCQl2YWxpZDsJCQkJCQkJXAog
CX0pCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
