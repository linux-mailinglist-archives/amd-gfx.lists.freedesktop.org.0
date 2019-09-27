Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F76BFD97
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 05:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DBB6EE44;
	Fri, 27 Sep 2019 03:23:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770073.outbound.protection.outlook.com [40.107.77.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F9D6EE44
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 03:23:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhfhJNjUyHOAg1bosVkxw259GW2XKIhHdonccWBlTC9AlvUF7NpKGaCmwXdGaZJT3TpcJ5W1Cto9O+UOyVpQoEKhhmiT/e5+RltqD9FxVL918pjHokgInSedAAU1P/S1jC9W/10FE9NWTJCSbY3LZ8T5hHgrQy37vb2G2f4hC2de0wbk+LqctV5EMO0dCYz1dVUmMOAFyF2CA5NdTE7n7U0jKSgFJgVI6OjYLP/nmgcYJlsMdFBSawRw43VsZFiIe2JzFLYMPHklfjK2KENzH2EVCq7C9lKAS29uOgMzbuBar37aYzP0ERYL0drk99jX1ONnrLR3a0rMOasDsmjFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHLilZIVtYfSFe2xp6mRk3jYKH2MKKM3GayxX/+N6qc=;
 b=WYsudZz8hAqbArayTE/AaYd1imOTJ8Il+oKfJxWU9Ntm5XnHoGjN6tGFjDpqqIwNB1HYEAFTOXLnnRPog16eFZCZA8UEWEV5JsVwNgj13sxwCJ1LCv7fM5G25Gy3vTpe4u7tkcYPZ+Nt9DvR9cFG//UJ0J1eSuC2S/z7subPxQ4Ky7Srwzz30H0FQCRxrjvNLQDarGDjnLyql6F+CIpOf1V3lw/O6iX/FZg4b2B54P0hBqd0YNiFWdu51f8OWckPWaXo2UaPP1ZiQvLsZgBX9WKLWS6tL+yFn3nC5GMCSXbzPC6eeIBz5DsoLMn1kOZ6on5BP0B1wnP+zrECsaVWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB4333.namprd12.prod.outlook.com (52.135.48.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Fri, 27 Sep 2019 03:23:28 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 03:23:28 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amdgpu: disable stutter mode for renoir"
Thread-Topic: [PATCH] Revert "drm/amdgpu: disable stutter mode for renoir"
Thread-Index: AQHVdOLtGEQQTtfo5kS5Hnvr8isGpg==
Date: Fri, 27 Sep 2019 03:23:27 +0000
Message-ID: <1569554593-18302-1-git-send-email-aaron.liu@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:203:2e::13) To MN2PR12MB3838.namprd12.prod.outlook.com
 (2603:10b6:208:166::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45982f8e-cb3c-4a84-742f-08d742fa0ff1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4333; 
x-ms-traffictypediagnostic: MN2PR12MB4333:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4333AE9D7BBDAFCD1D0BDF2AF0810@MN2PR12MB4333.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:66;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(199004)(189003)(2351001)(86362001)(186003)(6512007)(386003)(6116002)(4744005)(2906002)(6506007)(5640700003)(36756003)(50226002)(6486002)(81166006)(25786009)(54906003)(316002)(81156014)(66476007)(6436002)(3846002)(64756008)(66066001)(66556008)(8936002)(66446008)(71200400001)(2501003)(256004)(66946007)(476003)(478600001)(8676002)(7736002)(71190400001)(14454004)(99286004)(305945005)(102836004)(6916009)(486006)(5660300002)(4326008)(26005)(2616005)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4333;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OIlqre87t1wefPiqLgWaUi5i/SGthKt6pn5ioqtQq8XiuYg6I+fjieVKCMazcHaGFFiKNAcz4fzbkCEHyKKyNyqgaWR9FZnM1RBc7oDhpw9JH+a/4+8FbOWvwOlOAomDhPuAAvnM39jZ9zppFfphhHuMmVga1CYv35jNZaG3XcAiBuqdqOApai6VrZq3bfQ9hsSxY8WMiQbqJDqbv+9ZiJAJT3DiCF9ArMKGwGSkh5hKSGnXZPWDQJUU8thPm73B99lp01QqnDS5AZmzdmyYDinKh2FLxwP9j3P3Ky2pfiCz3W1zchW3r6h5zgi6TxdRYUsVjE1cBMVKX1pUteVSgRwcLR1wftieiC8z1K72DypnxdK40dJseTH4GE2cEuuwV25473CCmtwXcJthyx++fAP9WSWMEMulIIF7UGFi7aQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45982f8e-cb3c-4a84-742f-08d742fa0ff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 03:23:27.8370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9IU75I31+lxqor45FoWumK7RxIM/DIwjUnt3HVRqg0P0Iss81hEqTlbwxyl+QrE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHLilZIVtYfSFe2xp6mRk3jYKH2MKKM3GayxX/+N6qc=;
 b=Km4QkZpOXNpehf6cT5ZnV5ZPwZ4hYGRG5X4AXUSJqoVYaWphX2xd5d3aG1BlfGZLL68RHg8m7y/BkS1ZYvONzZ0q/B7MNVOsGQ1u9JfeLiIYqrCl4pLf1DYnVUQHFtXpUzuZs2910pc+2iKtZ4vLi2mTHh0VYSmBEoQiizb3ITI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBjNTEyZTZmZGZkMmRhOTE3YjViNjc5MjkwMmU3MjI0ZjU4YTc3
Zjk0LgoKU2luY2UgU0JJT1MgV0NEOTkyNU4sIE5NSSBwcmludGluZyBkaXNhcHBlYXJlZC4gSGVu
Y2UgZW5hYmxlIHN0dXR0ZXIKbW9kZS4KClNpZ25lZC1vZmYtYnk6IEFhcm9uIExpdSA8YWFyb24u
bGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4
IGJkYWIzZjcuLjlkOGQ3ZTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMjQ2Niw4ICsyNDY2LDYgQEAgc3RhdGljIGludCBh
bWRncHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCiAJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190
eXBlICE9IENISVBfU1RPTkVZKQogCQlkbS0+ZGMtPmRlYnVnLmRpc2FibGVfc3R1dHRlciA9IGFt
ZGdwdV9wcF9mZWF0dXJlX21hc2sgJiBQUF9TVFVUVEVSX01PREUgPyBmYWxzZSA6IHRydWU7Ci0J
aWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKLQkJZG0tPmRjLT5kZWJ1Zy5kaXNh
YmxlX3N0dXR0ZXIgPSB0cnVlOwogCiAJcmV0dXJuIDA7CiBmYWlsOgotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
