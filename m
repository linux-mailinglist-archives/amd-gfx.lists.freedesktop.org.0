Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB0A15CFF
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 08:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92B289C48;
	Tue,  7 May 2019 06:09:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710087.outbound.protection.outlook.com [40.107.71.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E96C89C48
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 06:09:19 +0000 (UTC)
Received: from DM3PR12CA0088.namprd12.prod.outlook.com (2603:10b6:0:57::32) by
 BN6PR12MB1139.namprd12.prod.outlook.com (2603:10b6:404:1d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 06:09:17 +0000
Received: from CO1NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM3PR12CA0088.outlook.office365.com
 (2603:10b6:0:57::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 7 May 2019 06:09:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT030.mail.protection.outlook.com (10.152.80.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 7 May 2019 06:09:16 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 7 May 2019
 01:09:13 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amd/powerplay: fix Vega10 mclk/socclk voltage link
 setup
Date: Tue, 7 May 2019 14:08:56 +0800
Message-ID: <20190507060859.27650-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(14444005)(72206003)(26005)(6916009)(1076003)(5660300002)(2351001)(186003)(2870700001)(8936002)(77096007)(8676002)(81166006)(81156014)(2906002)(53936002)(53416004)(478600001)(426003)(7696005)(51416003)(68736007)(54906003)(356004)(6666004)(50226002)(336012)(316002)(86362001)(486006)(70206006)(70586007)(305945005)(126002)(50466002)(476003)(47776003)(2616005)(4326008)(44832011)(48376002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1139; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9900c54b-f587-46ee-7e35-08d6d2b2892f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR12MB1139; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1139:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1139A010D8CADC824E9CDD60E4310@BN6PR12MB1139.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0030839EEE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LU58VcHgy5GTYqpLXlUFVmY5zefLUJTr+gsmMAoE3Fw/tLeYN9ULQseirG3trOUHqQ7gbU5dxCTCY/6Nwhps+jhbde8G3uBFt7YfErghte1CCBi7MXPNyg+1B9w0k4G8YsmxjfMaME/+aYnvpILZH08TUKV/iwmAUXfDqhG4o0fhQz/5omaC9f8FPgw3HLK/sUD3aVCE12G3bHd+3zf4Mw4ekO+j8WN3pYKQtQ3gjq5Jox3SAnnCWK485ykY11c5f4ZemxhEMapU8AIbRKlBP5MV5W7/NO0+uYH8ubk8J2uQVr9PC+/qmCU6T/o11C8OE6rEubZ9c2Zkz2TecZRADnsFx+8fATvspY/WoUECuO7MgxVhmW3IeqsMcPYa7cDhf5GU6OgUnVum1q8quJZfo7/424lSA1E0fjwaHgHeq8E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2019 06:09:16.4474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9900c54b-f587-46ee-7e35-08d6d2b2892f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1139
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzBBZiAvpwTaTey23EAdHUVExRXItDMUvoLAsy+TkO0=;
 b=0x2N+oNzVR+859yaZHypt+Uhtpr74JSWuwr5VYvgnPBXXFDmQfxMKxqzTvQbTWBuZw2nRp1he61ClCZG+7z4jNofSN8nOEhEo5EuPwAWzLLLiAriVIxKeSPAZBbOWBz02iPOLAg9uKOrw3G672EcLT+fdkiKswcRJ3XLMw1El4Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; yiannakis.de; dkim=none (message not signed)
 header.d=none;yiannakis.de; dmarc=permerror action=none header.from=amd.com;
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
Cc: yanik@yiannakis.de, Alexander.Deucher@amd.com,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBtYXkgYWZmZWN0cyB0aGUgVmVnYTEwIE1DTEsgT0QgZnVuY3Rpb25hbGl0eS4KCkNoYW5n
ZS1JZDogSWNkNjg1MTg3NTAxYjRlYzg4NjdmYjNjNTA3N2VhMjY2NGVkYmQxMTQKU2lnbmVkLW9m
Zi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMgICAgfCAzNSArKysrKysrKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYwppbmRl
eCBkNWQwZGI0NTYwMjEuLjEzOGY5ZjllYTc2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMKQEAgLTUwMTYsNyArNTAxNiw3IEBA
IHN0YXRpYyB2b2lkIHZlZ2ExMF9vZG5fdXBkYXRlX3NvY190YWJsZShzdHJ1Y3QgcHBfaHdtZ3Ig
Kmh3bWdyLAogCXN0cnVjdCB2ZWdhMTBfaHdtZ3IgKmRhdGEgPSBod21nci0+YmFja2VuZDsKIAlz
dHJ1Y3QgcGhtX3BwdF92Ml9pbmZvcm1hdGlvbiAqdGFibGVfaW5mbyA9IGh3bWdyLT5wcHRhYmxl
OwogCXN0cnVjdCBwaG1fcHB0X3YxX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV90YWJsZSAqZGVw
X3RhYmxlID0gdGFibGVfaW5mby0+dmRkX2RlcF9vbl9zb2NjbGs7Ci0Jc3RydWN0IHZlZ2ExMF9z
aW5nbGVfZHBtX3RhYmxlICpkcG1fdGFibGUgPSAmZGF0YS0+Z29sZGVuX2RwbV90YWJsZS5zb2Nf
dGFibGU7CisJc3RydWN0IHZlZ2ExMF9zaW5nbGVfZHBtX3RhYmxlICpkcG1fdGFibGUgPSAmZGF0
YS0+Z29sZGVuX2RwbV90YWJsZS5tZW1fdGFibGU7CiAKIAlzdHJ1Y3QgdmVnYTEwX29kbl9jbG9j
a192b2x0YWdlX2RlcGVuZGVuY3lfdGFibGUgKnBvZG5fdmRkX2RlcF9vbl9zb2NjbGsgPQogCQkJ
CQkJCSZkYXRhLT5vZG5fZHBtX3RhYmxlLnZkZF9kZXBfb25fc29jY2xrOwpAQCAtNTA0MCw3ICs1
MDQwLDggQEAgc3RhdGljIHZvaWQgdmVnYTEwX29kbl91cGRhdGVfc29jX3RhYmxlKHN0cnVjdCBw
cF9od21nciAqaHdtZ3IsCiAJCQkJCWJyZWFrOwogCQkJfQogCQkJaWYgKGogPT0gb2RfdmRkY19s
b29rdXBfdGFibGUtPmNvdW50KSB7Ci0JCQkJb2RfdmRkY19sb29rdXBfdGFibGUtPmVudHJpZXNb
ai0xXS51c192ZGQgPQorCQkJCWogPSBvZF92ZGRjX2xvb2t1cF90YWJsZS0+Y291bnQgLSAxOwor
CQkJCW9kX3ZkZGNfbG9va3VwX3RhYmxlLT5lbnRyaWVzW2pdLnVzX3ZkZCA9CiAJCQkJCXBvZG5f
dmRkX2RlcC0+ZW50cmllc1tpXS52ZGRjOwogCQkJCWRhdGEtPm5lZWRfdXBkYXRlX2RwbV90YWJs
ZSB8PSBEUE1UQUJMRV9PRF9VUERBVEVfVkREQzsKIAkJCX0KQEAgLTUwNDgsMjMgKzUwNDksMzUg
QEAgc3RhdGljIHZvaWQgdmVnYTEwX29kbl91cGRhdGVfc29jX3RhYmxlKHN0cnVjdCBwcF9od21n
ciAqaHdtZ3IsCiAJCX0KIAkJZHBtX3RhYmxlID0gJmRhdGEtPmRwbV90YWJsZS5zb2NfdGFibGU7
CiAJCWZvciAoaSA9IDA7IGkgPCBkZXBfdGFibGUtPmNvdW50OyBpKyspIHsKLQkJCWlmIChkZXBf
dGFibGUtPmVudHJpZXNbaV0udmRkSW5kID09IHBvZG5fdmRkX2RlcC0+ZW50cmllc1tkZXBfdGFi
bGUtPmNvdW50LTFdLnZkZEluZCAmJgotCQkJCQlkZXBfdGFibGUtPmVudHJpZXNbaV0uY2xrIDwg
cG9kbl92ZGRfZGVwLT5lbnRyaWVzW2RlcF90YWJsZS0+Y291bnQtMV0uY2xrKSB7CisJCQlpZiAo
ZGVwX3RhYmxlLT5lbnRyaWVzW2ldLnZkZEluZCA9PSBwb2RuX3ZkZF9kZXAtPmVudHJpZXNbcG9k
bl92ZGRfZGVwLT5jb3VudC0xXS52ZGRJbmQgJiYKKwkJCQkJZGVwX3RhYmxlLT5lbnRyaWVzW2ld
LmNsayA8IHBvZG5fdmRkX2RlcC0+ZW50cmllc1twb2RuX3ZkZF9kZXAtPmNvdW50LTFdLmNsaykg
ewogCQkJCWRhdGEtPm5lZWRfdXBkYXRlX2RwbV90YWJsZSB8PSBEUE1UQUJMRV9VUERBVEVfU09D
Q0xLOwotCQkJCXBvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmVudHJpZXNbaV0uY2xrID0gcG9kbl92
ZGRfZGVwLT5lbnRyaWVzW2RlcF90YWJsZS0+Y291bnQtMV0uY2xrOwotCQkJCWRwbV90YWJsZS0+
ZHBtX2xldmVsc1tpXS52YWx1ZSA9IHBvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmVudHJpZXNbaV0u
Y2xrOworCQkJCWZvciAoOyAoaSA8IGRlcF90YWJsZS0+Y291bnQpICYmCisJCQkJICAgICAgIChk
ZXBfdGFibGUtPmVudHJpZXNbaV0uY2xrIDwgcG9kbl92ZGRfZGVwLT5lbnRyaWVzW3BvZG5fdmRk
X2RlcC0+Y291bnQgLSAxXS5jbGspOyBpKyspIHsKKwkJCQkJcG9kbl92ZGRfZGVwX29uX3NvY2Ns
ay0+ZW50cmllc1tpXS5jbGsgPSBwb2RuX3ZkZF9kZXAtPmVudHJpZXNbcG9kbl92ZGRfZGVwLT5j
b3VudC0xXS5jbGs7CisJCQkJCWRwbV90YWJsZS0+ZHBtX2xldmVsc1tpXS52YWx1ZSA9IHBvZG5f
dmRkX2RlcF9vbl9zb2NjbGstPmVudHJpZXNbaV0uY2xrOworCQkJCX0KKwkJCQlicmVhazsKKwkJ
CX0gZWxzZSB7CisJCQkJZHBtX3RhYmxlLT5kcG1fbGV2ZWxzW2ldLnZhbHVlID0gZGVwX3RhYmxl
LT5lbnRyaWVzW2ldLmNsazsKKwkJCQlwb2RuX3ZkZF9kZXBfb25fc29jY2xrLT5lbnRyaWVzW2ld
LnZkZGMgPSBkZXBfdGFibGUtPmVudHJpZXNbaV0udmRkYzsKKwkJCQlwb2RuX3ZkZF9kZXBfb25f
c29jY2xrLT5lbnRyaWVzW2ldLnZkZEluZCA9IGRlcF90YWJsZS0+ZW50cmllc1tpXS52ZGRJbmQ7
CisJCQkJcG9kbl92ZGRfZGVwX29uX3NvY2Nsay0+ZW50cmllc1tpXS5jbGsgPSBkZXBfdGFibGUt
PmVudHJpZXNbaV0uY2xrOwogCQkJfQogCQl9CiAJCWlmIChwb2RuX3ZkZF9kZXBfb25fc29jY2xr
LT5lbnRyaWVzW3BvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmNvdW50IC0gMV0uY2xrIDwKLQkJCQkJ
cG9kbl92ZGRfZGVwLT5lbnRyaWVzW2RlcF90YWJsZS0+Y291bnQtMV0uY2xrKSB7CisJCQkJCXBv
ZG5fdmRkX2RlcC0+ZW50cmllc1twb2RuX3ZkZF9kZXAtPmNvdW50IC0gMV0uY2xrKSB7CiAJCQlk
YXRhLT5uZWVkX3VwZGF0ZV9kcG1fdGFibGUgfD0gRFBNVEFCTEVfVVBEQVRFX1NPQ0NMSzsKLQkJ
CXBvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmVudHJpZXNbcG9kbl92ZGRfZGVwX29uX3NvY2Nsay0+
Y291bnQgLSAxXS5jbGsgPSBwb2RuX3ZkZF9kZXAtPmVudHJpZXNbZGVwX3RhYmxlLT5jb3VudC0x
XS5jbGs7Ci0JCQlkcG1fdGFibGUtPmRwbV9sZXZlbHNbcG9kbl92ZGRfZGVwX29uX3NvY2Nsay0+
Y291bnQgLSAxXS52YWx1ZSA9IHBvZG5fdmRkX2RlcC0+ZW50cmllc1tkZXBfdGFibGUtPmNvdW50
LTFdLmNsazsKKwkJCXBvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmVudHJpZXNbcG9kbl92ZGRfZGVw
X29uX3NvY2Nsay0+Y291bnQgLSAxXS5jbGsgPQorCQkJCXBvZG5fdmRkX2RlcC0+ZW50cmllc1tw
b2RuX3ZkZF9kZXAtPmNvdW50IC0gMV0uY2xrOworCQkJZHBtX3RhYmxlLT5kcG1fbGV2ZWxzW3Bv
ZG5fdmRkX2RlcF9vbl9zb2NjbGstPmNvdW50IC0gMV0udmFsdWUgPQorCQkJCXBvZG5fdmRkX2Rl
cC0+ZW50cmllc1twb2RuX3ZkZF9kZXAtPmNvdW50IC0gMV0uY2xrOwogCQl9CiAJCWlmIChwb2Ru
X3ZkZF9kZXBfb25fc29jY2xrLT5lbnRyaWVzW3BvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmNvdW50
IC0gMV0udmRkSW5kIDwKLQkJCQkJcG9kbl92ZGRfZGVwLT5lbnRyaWVzW2RlcF90YWJsZS0+Y291
bnQtMV0udmRkSW5kKSB7CisJCQkJCXBvZG5fdmRkX2RlcC0+ZW50cmllc1twb2RuX3ZkZF9kZXAt
PmNvdW50IC0gMV0udmRkSW5kKSB7CiAJCQlkYXRhLT5uZWVkX3VwZGF0ZV9kcG1fdGFibGUgfD0g
RFBNVEFCTEVfVVBEQVRFX1NPQ0NMSzsKLQkJCXBvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmVudHJp
ZXNbcG9kbl92ZGRfZGVwX29uX3NvY2Nsay0+Y291bnQgLSAxXS52ZGRJbmQgPSBwb2RuX3ZkZF9k
ZXAtPmVudHJpZXNbZGVwX3RhYmxlLT5jb3VudC0xXS52ZGRJbmQ7CisJCQlwb2RuX3ZkZF9kZXBf
b25fc29jY2xrLT5lbnRyaWVzW3BvZG5fdmRkX2RlcF9vbl9zb2NjbGstPmNvdW50IC0gMV0udmRk
SW5kID0KKwkJCQlwb2RuX3ZkZF9kZXAtPmVudHJpZXNbcG9kbl92ZGRfZGVwLT5jb3VudCAtIDFd
LnZkZEluZDsKIAkJfQogCX0KIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
