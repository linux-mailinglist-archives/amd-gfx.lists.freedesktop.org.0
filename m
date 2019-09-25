Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FC6BE46E
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 20:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493106EC90;
	Wed, 25 Sep 2019 18:15:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359C86EC8B
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 18:15:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iN6pbeK5Fz/dn0pFvUjRJyxgRMQvDae2TAtQQETPPMaxS/Go3KZxyf5bxFwj9zMNYXRyIqlKf15f8stIFZa/5ajNyD7DZ+/XvbmxMQIjiFoiJZgy+HQljGoPi/4VvQjLbJdeOK0caYFsBEqOJlat8iRVR2eqshKsYHUMqNdgE9tA6d2rZu18Slr5mDVvL9CzuKFvcTWHzBTIdaxGMBy3px1ll18IbjWjCfXqZWpR4W2HLQCXTE1milMwQdf/V3mhvp3E/1SXXxJShcTzAP+Deom+JKsRKbxNI0yuzSPOOy2DagVxxhApd+riV7GADKFKK0YA9bVMtPeJOCdVzMUNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVZY/pwHueaM9ND5hMZwd140XU4saTpfl0MXFf+jKJc=;
 b=aRZzDQQpMg4BTEBoofM5AZjOLtZJHscfRsedAqbaDeiTaro7LdBF0y582ny3vCCegmGXaDTfHnFVlF2A1ulidNTPJYDwIEDB2cYI/XmpVxigjATy8IDPOBVCylhr8tMFENgtqD6POzHATvDn9xSRZqFSa2FgHQ3SddWkKf/DYKOSuXNbDb+MXMCEJgFyxI/aNrfd7mJX179LHyRNvef+w+WyrGOwaaQu+lg3XNVV1WKPPVNEaWRs+NP4aPDLLFxooktqueUnMPgKwZF90fwHttgUOhTY9XXmK0BBvq0Uyu1+ptBHieNcIdWtvtYh+c+DiGZuqS3LwckitLw8BFsH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2681.namprd12.prod.outlook.com (20.176.116.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Wed, 25 Sep 2019 18:15:44 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 18:15:44 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdkfd: Use setup_vm_pt_regs function from base
 driver in KFD
Thread-Topic: [PATCH 2/3] drm/amdkfd: Use setup_vm_pt_regs function from base
 driver in KFD
Thread-Index: AQHVc80+JdNclQ0aukiH3a23Co0+ag==
Date: Wed, 25 Sep 2019 18:15:43 +0000
Message-ID: <20190925181527.17091-2-Yong.Zhao@amd.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>
In-Reply-To: <20190925181527.17091-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c88b5622-1a78-41cd-48b9-08d741e46149
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2681; 
x-ms-traffictypediagnostic: DM6PR12MB2681:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB26812C8BEB94BBE6557960ABF0870@DM6PR12MB2681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(6512007)(486006)(36756003)(8936002)(2906002)(476003)(6116002)(6916009)(50226002)(305945005)(7736002)(1076003)(11346002)(66066001)(2351001)(102836004)(386003)(26005)(2501003)(4326008)(3846002)(71190400001)(71200400001)(66556008)(81156014)(66946007)(64756008)(6486002)(2616005)(76176011)(446003)(99286004)(86362001)(6506007)(5640700003)(6436002)(186003)(14444005)(14454004)(81166006)(8676002)(66476007)(52116002)(25786009)(66446008)(256004)(316002)(5660300002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2681;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mVsGU/JJyhs1uIN/GW1xScqe2pZLfbzWyLmVKXUGkXDuaeYXrVeZUSis9TuU5yCgKmYjZ9xII9kRcHUrxacUjRp2cNAbSfreFl0b+LFm35SFvgfIvXWAbUoOuEgt1zAHjzPam+w3X0eDGucdv19HuH0jMRcCfaCeD3gc6+iZr0eC9VcWeLqQsIgyv0FJBinonWUkMJawgQZ1syH4g6d+gegW6hmk1kvQ7xwtIhAWZWWkusLfh7JqnI9DdXLP2cVBkWIGAGzq7w53/7Xnt02GWDOwnaLGXcyArxsq95QjPUnnX6NUzNsbuBb5ddwer/KhXM6Aiv2Co6MXB8OyT1D9gplhudvft8+WbeZf+w3qj6SZsxv3nOzAJGk3N8XNv97knBdDOiftfq7LaRP+3U0fn7qt3881eZWdoIRgXXO6KEU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88b5622-1a78-41cd-48b9-08d741e46149
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 18:15:43.9464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osG/Zbape3mus+CFr4zBm/G+cgw3YilyrHts9EX6s6xPg3FchFQZtBNqERUqVHEa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVZY/pwHueaM9ND5hMZwd140XU4saTpfl0MXFf+jKJc=;
 b=l5w6H2ZtXc0WfYuAXQtlLIYB19zH32eDCJWT3RpYmQ1cvTGRb4wVlpC+NidIrKMHtMUqtX4MYfDF/ZzGH0zDl6m9KQnI/lfYc0iRPYWI6Vtl7G5XpcJxo8WQDFVzQlpZub9miWBTC75VG/2LTAf8n3xyH7Sp6dBwieSvbBJWz3M=
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

VGhpcyB3YXMgZG9uZSBvbiBHRlg5IHByZXZpb3VzbHksIG5vdyBkbyBpdCBmb3IgR0ZYMTAuCgpD
aGFuZ2UtSWQ6IEk0NDQyZTYwNTM0YzU5YmM5NTI2YTY3MzU1OWYwMThiYTgwNThkZWFjClNpZ25l
ZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQogLi4uL2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3YxMC5jICAgIHwgMjMgKysrLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYwpp
bmRleCBmZTViNzAyYzc1Y2UuLjY0NTY4ZWQzMjc5MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMKQEAgLTQyLDYgKzQyLDcgQEAK
ICNpbmNsdWRlICJ2MTBfc3RydWN0cy5oIgogI2luY2x1ZGUgIm52LmgiCiAjaW5jbHVkZSAibnZk
LmgiCisjaW5jbHVkZSAiZ2Z4aHViX3YyXzAuaCIKIAogZW51bSBocWRfZGVxdWV1ZV9yZXF1ZXN0
X3R5cGUgewogCU5PX0FDVElPTiA9IDAsCkBAIC0yNTEsMTEgKzI1Miw2IEBAIHN0YXRpYyBpbnQg
a2dkX3NldF9wYXNpZF92bWlkX21hcHBpbmcoc3RydWN0IGtnZF9kZXYgKmtnZCwgdW5zaWduZWQg
aW50IHBhc2lkLAogCQkJQVRDX1ZNSUQwX1BBU0lEX01BUFBJTkdfX1ZBTElEX01BU0s7CiAKIAlw
cl9kZWJ1ZygicGFzaWQgMHgleCB2bWlkICVkLCByZWcgdmFsdWUgJXhcbiIsIHBhc2lkLCB2bWlk
LCBwYXNpZF9tYXBwaW5nKTsKLQkvKgotCSAqIG5lZWQgdG8gZG8gdGhpcyB0d2ljZSwgb25jZSBm
b3IgZ2Z4IGFuZCBvbmNlIGZvciBtbWh1YgotCSAqIGZvciBBVEMgYWRkIDE2IHRvIFZNSUQgZm9y
IG1taHViLCBmb3IgSUggZGlmZmVyZW50IHJlZ2lzdGVycy4KLQkgKiBBVENfVk1JRDAuLjE1IHJl
Z2lzdGVycyBhcmUgc2VwYXJhdGUgZnJvbSBBVENfVk1JRDE2Li4zMS4KLQkgKi8KIAogCXByX2Rl
YnVnKCJBVEhVQiwgcmVnICV4XG4iLCBTT0MxNV9SRUdfT0ZGU0VUKEFUSFVCLCAwLCBtbUFUQ19W
TUlEMF9QQVNJRF9NQVBQSU5HKSArIHZtaWQpOwogCVdSRUczMihTT0MxNV9SRUdfT0ZGU0VUKEFU
SFVCLCAwLCBtbUFUQ19WTUlEMF9QQVNJRF9NQVBQSU5HKSArIHZtaWQsCkBAIC05MTAsNyArOTA2
LDYgQEAgc3RhdGljIHZvaWQgc2V0X3ZtX2NvbnRleHRfcGFnZV90YWJsZV9iYXNlKHN0cnVjdCBr
Z2RfZGV2ICprZ2QsIHVpbnQzMl90IHZtaWQsCiAJCXVpbnQ2NF90IHBhZ2VfdGFibGVfYmFzZSkK
IHsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGdldF9hbWRncHVfZGV2aWNlKGtnZCk7
Ci0JdWludDY0X3QgYmFzZSA9IHBhZ2VfdGFibGVfYmFzZSB8IEFNREdQVV9QVEVfVkFMSUQ7CiAK
IAlpZiAoIWFtZGdwdV9hbWRrZmRfaXNfa2ZkX3ZtaWQoYWRldiwgdm1pZCkpIHsKIAkJcHJfZXJy
KCJ0cnlpbmcgdG8gc2V0IHBhZ2UgdGFibGUgYmFzZSBmb3Igd3JvbmcgVk1JRCAldVxuIiwKQEAg
LTkxOCwxOCArOTEzLDYgQEAgc3RhdGljIHZvaWQgc2V0X3ZtX2NvbnRleHRfcGFnZV90YWJsZV9i
YXNlKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQzMl90IHZtaWQsCiAJCXJldHVybjsKIAl9CiAK
LQkvKiBUT0RPOiB0YWtlIGFkdmFudGFnZSBvZiBwZXItcHJvY2VzcyBhZGRyZXNzIHNwYWNlIHNp
emUuIEZvcgotCSAqIG5vdywgYWxsIHByb2Nlc3NlcyBzaGFyZSB0aGUgc2FtZSBhZGRyZXNzIHNw
YWNlIHNpemUsIGxpa2UKLQkgKiBvbiBHRlg4IGFuZCBvbGRlci4KLQkgKi8KLQlXUkVHMzIoU09D
MTVfUkVHX09GRlNFVChHQywgMCwgbW1HQ1ZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfU1RBUlRfQURE
Ul9MTzMyKSArICh2bWlkKjIpLCAwKTsKLQlXUkVHMzIoU09DMTVfUkVHX09GRlNFVChHQywgMCwg
bW1HQ1ZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfU1RBUlRfQUREUl9ISTMyKSArICh2bWlkKjIpLCAw
KTsKLQotCVdSRUczMihTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdDVk1fQ09OVEVYVDBfUEFH
RV9UQUJMRV9FTkRfQUREUl9MTzMyKSArICh2bWlkKjIpLAotCQkJbG93ZXJfMzJfYml0cyhhZGV2
LT52bV9tYW5hZ2VyLm1heF9wZm4gLSAxKSk7Ci0JV1JFRzMyKFNPQzE1X1JFR19PRkZTRVQoR0Ms
IDAsIG1tR0NWTV9DT05URVhUMF9QQUdFX1RBQkxFX0VORF9BRERSX0hJMzIpICsgKHZtaWQqMiks
Ci0JCQl1cHBlcl8zMl9iaXRzKGFkZXYtPnZtX21hbmFnZXIubWF4X3BmbiAtIDEpKTsKLQotCVdS
RUczMihTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbUdDVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9C
QVNFX0FERFJfTE8zMikgKyAodm1pZCoyKSwgbG93ZXJfMzJfYml0cyhiYXNlKSk7Ci0JV1JFRzMy
KFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0NWTV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0Vf
QUREUl9ISTMyKSArICh2bWlkKjIpLCB1cHBlcl8zMl9iaXRzKGJhc2UpKTsKKwkvKiBTRE1BIGlz
IG9uIGdmeGh1YiBhcyB3ZWxsIG9uIE5hdmkxKiBzZXJpZXMgKi8KKwlnZnhodWJfdjJfMF9zZXR1
cF92bV9wdF9yZWdzKGFkZXYsIHZtaWQsIHBhZ2VfdGFibGVfYmFzZSk7CiB9Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
