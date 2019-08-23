Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 118ED9B786
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 22:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663F26ED2D;
	Fri, 23 Aug 2019 20:01:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D87D6ED2D
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 20:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVRvO0Iqh+me5njV/iOa3o5wLy5ZhbzbPSv4rMSX8UwnKTZ/9+ZTCD0XMHi9VQ9wO91X0KIUXTadPeqD/YMkCQ0l2dBM/Ch/SNJy89QH/6vk8Sr90OxMM22NGGivLxUz0ugqYAwN+HBPZR9mYyP1S4rBEFNH0HpbvWu7rkSggeEVWR79KJkMzXw8T2UYBx9LjiVxowxWhF+yD5WEJjj5VBgamBGGpFaLF4oG7+v/Hm2QLkSFiUMNkUstk5JaNr9liqCmmxgRl74EMKxmXGfdQaqEzICmz7+fOHC56gpKzl6IStZK7omBHD0hT/LbeZDIfus4HCyXTY9x3z0CTzFQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1nj0Qot+F4iK6UfUNTEhDuDKDIEdMuHkUUU9OrVskI=;
 b=RCdcwOrzU3uxgZQH+KgJ0uF7swpcvD8gVoQF5JMKE+O7sTFcoFHUziSKB0/ImhV1vcXFlV7kBFyAiNhfuLm/Ulc+2//QjEifcdrz1lZQ9c2xxmIcfi31U4YXOzmmA2ptWyip9qylMwyGmmql09PwGJPXIFib+POatQjirUB9jfe4uqzWrIaYm7dTLk1eeFk3SuIq2Rx3JuW/EA1GNP9O/bxoZPeuPiSoIzexMUGTnIfv2EQwKI1gCVPbCQwYdZAwEQVlnUMvyIfj7Rf0Hs+N+KSE5zSGYhpBnhCrkyMVykVSjVaWKohc1NNxZW0Yq/j7cisqMWtjhii76LPJcD4VoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1908.namprd12.prod.outlook.com (10.175.95.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.20; Fri, 23 Aug 2019 20:01:44 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 20:01:44 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amdgpu: free up the first paging queue v2"
Thread-Topic: [PATCH] Revert "drm/amdgpu: free up the first paging queue v2"
Thread-Index: AQHVWe2WSLM5g4j3YEK6lQnDTHKPww==
Date: Fri, 23 Aug 2019 20:01:44 +0000
Message-ID: <1566590496-27967-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::40) To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3e52efb-2261-4d4f-49ae-08d72804b8bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1908; 
x-ms-traffictypediagnostic: BN6PR12MB1908:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB19086161075DEAA137422F70FFA40@BN6PR12MB1908.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:143;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(189003)(199004)(71190400001)(71200400001)(476003)(2616005)(26005)(8936002)(486006)(66946007)(386003)(256004)(2351001)(99286004)(2501003)(6486002)(66446008)(64756008)(6436002)(66066001)(5640700003)(4326008)(186003)(25786009)(66476007)(66556008)(6506007)(6512007)(478600001)(53936002)(14454004)(5660300002)(7736002)(2906002)(6916009)(81156014)(8676002)(81166006)(316002)(52116002)(102836004)(50226002)(305945005)(6116002)(3846002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1908;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nZGFQXoX9Swh5wccW2OxwmFJXbrydZH7qrjHKDEMcKVdYtXis6hDzwPx2rNkx3ivoL2E1n+h1IzwvoTsP6q8weeRq5lRVGskqU3EZt1wKK3ApbbvYbpyXLG6qXW41uFh5bwG5sX0YwXzNQehhZFEURU2R0KZHpfFJ6UCGdmL5iX9AujKi35dZ2mmSRq1xQUz1L/OdWYUoc4sY8FHg4okcv7fR8QnJfvCXtmS1ctn2WgYjjLwYpid3GgtcE9q39pNPWO2wijJ+z0fL094UEbjpl/0/klY3SyWQc7pQdlWj4PakEvw/Gwq8m5ilI5y2njLfXajLBAjVYf+zguPoEw5X/1kZ9p8E55nGnj/Ft/pNiDUGhhWomRiVngQVsDCAL2Dj/63Vs0qcZQPihywZOO8dnCGd6XTW7kb69sqmQlmcww=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e52efb-2261-4d4f-49ae-08d72804b8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 20:01:44.3031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhgS0IsDFpj6luOHj2zf/QUB6ZHwpHnyXyvWFWgk250ccgvVJcutHiqHM8tsTl5S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1nj0Qot+F4iK6UfUNTEhDuDKDIEdMuHkUUU9OrVskI=;
 b=aw/fANN7oplnHK+zMsfvtmmsXmQmQ9CpN2U1I9/m2bfWHPZnpoybYPPwso2bM25bCDfhbUR5vKuS9zsUCjYZQsOp57wYuQr0YBjkOdB0DXmKaRND50XaeogZRNQ7PQC8gtrBqrcDvb5UCmrj4DUU23XMjgtKwWJDIyhvPCNY5KY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Gang.Ba@amd.com; 
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA0ZjhiYzcyZmJmMTBmMmRjOGJjYTc0ZDVkYTA4YjNhOTgxYjJl
NWNkLgoKQ2hhbmdlLUlkOiBJNTc3YmEyMzZlMDU3MWQxMTQwMGE1MWY5ZDk1ODQwMjM0YWVmNjc4
YQotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMjMgKysrKysr
KystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggYjNi
MmMyMS4uNzc1MGIzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAg
LTI1MDAsOCArMjUwMCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2J1ZmZlcl9mdW5j
cyBzZG1hX3Y0XzBfYnVmZmVyX2Z1bmNzID0gewogc3RhdGljIHZvaWQgc2RtYV92NF8wX3NldF9i
dWZmZXJfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJYWRldi0+bW1hbi5i
dWZmZXJfZnVuY3MgPSAmc2RtYV92NF8wX2J1ZmZlcl9mdW5jczsKLQlpZiAoYWRldi0+c2RtYS5o
YXNfcGFnZV9xdWV1ZSAmJiBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXMgPiAxKQotCQlhZGV2LT5t
bWFuLmJ1ZmZlcl9mdW5jc19yaW5nID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbMV0ucGFnZTsKKwlp
ZiAoYWRldi0+c2RtYS5oYXNfcGFnZV9xdWV1ZSkKKwkJYWRldi0+bW1hbi5idWZmZXJfZnVuY3Nf
cmluZyA9ICZhZGV2LT5zZG1hLmluc3RhbmNlWzBdLnBhZ2U7CiAJZWxzZQogCQlhZGV2LT5tbWFu
LmJ1ZmZlcl9mdW5jc19yaW5nID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbMF0ucmluZzsKIH0KQEAg
LTI1MjAsMjIgKzI1MjAsMTUgQEAgc3RhdGljIHZvaWQgc2RtYV92NF8wX3NldF92bV9wdGVfZnVu
Y3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdW5zaWduZWQgaTsKIAogCWFkZXYtPnZt
X21hbmFnZXIudm1fcHRlX2Z1bmNzID0gJnNkbWFfdjRfMF92bV9wdGVfZnVuY3M7Ci0JaWYgKGFk
ZXYtPnNkbWEuaGFzX3BhZ2VfcXVldWUgJiYgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzID4gMSkg
ewotCQlmb3IgKGkgPSAxOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsKKwlm
b3IgKGkgPSAwOyBpIDwgYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOyBpKyspIHsKKwkJaWYgKGFk
ZXYtPnNkbWEuaGFzX3BhZ2VfcXVldWUpCiAJCQlzY2hlZCA9ICZhZGV2LT5zZG1hLmluc3RhbmNl
W2ldLnBhZ2Uuc2NoZWQ7Ci0JCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9ycXNbaSAtIDFdID0K
LQkJCQkmc2NoZWQtPnNjaGVkX3JxW0RSTV9TQ0hFRF9QUklPUklUWV9LRVJORUxdOwotCQl9Ci0J
CWFkZXYtPnZtX21hbmFnZXIudm1fcHRlX251bV9ycXMgPSBhZGV2LT5zZG1hLm51bV9pbnN0YW5j
ZXMgLSAxOwotCQlhZGV2LT52bV9tYW5hZ2VyLnBhZ2VfZmF1bHQgPSAmYWRldi0+c2RtYS5pbnN0
YW5jZVswXS5wYWdlOwotCX0gZWxzZSB7Ci0JCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5zZG1hLm51
bV9pbnN0YW5jZXM7IGkrKykgeworCQllbHNlCiAJCQlzY2hlZCA9ICZhZGV2LT5zZG1hLmluc3Rh
bmNlW2ldLnJpbmcuc2NoZWQ7Ci0JCQlhZGV2LT52bV9tYW5hZ2VyLnZtX3B0ZV9ycXNbaV0gPQot
CQkJCSZzY2hlZC0+c2NoZWRfcnFbRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTF07Ci0JCX0KLQkJ
YWRldi0+dm1fbWFuYWdlci52bV9wdGVfbnVtX3JxcyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNl
czsKKwkJYWRldi0+dm1fbWFuYWdlci52bV9wdGVfcnFzW2ldID0KKwkJCSZzY2hlZC0+c2NoZWRf
cnFbRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTF07CiAJfQorCWFkZXYtPnZtX21hbmFnZXIudm1f
cHRlX251bV9ycXMgPSBhZGV2LT5zZG1hLm51bV9pbnN0YW5jZXM7CiB9CiAKIGNvbnN0IHN0cnVj
dCBhbWRncHVfaXBfYmxvY2tfdmVyc2lvbiBzZG1hX3Y0XzBfaXBfYmxvY2sgPSB7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
