Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167C27D5E6
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDB86E39E;
	Thu,  1 Aug 2019 06:54:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3525E6E39E
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDAY3m5BbSHQS/e8mFRZi9OScesKyabx12ZhOuCfrbRlV6QQGBXwa6dLitgHMRyjcLxtOxpfk0qB9MMqaeGRyX0FvteKCPAgIdMAJxfeCXC7AoDmbAHNkjl0BCw+O0HSFMzPnXPI3opbl/B50nIdWpi+XYlMcZtg0+OwfTJWb4mRe8GBfq3d4V3tnWKiU/CaXcrousKVjZcuYzOAfSMngssUWorF+Hz2V9/idajZ+SfB8uyuCgh9t/cnOxg8Rx/+lVGZpxsZi2XGG0st6LYFRH6gaHsT4mKwTUKuGW5X26h7HEOVQVhQZ+xD526AHxaS9iuBd5/XkCjV2LGhW+jGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsjRnTcitQTpyIBkXg99w8C+TGuCi2nMd5Z06r1VRIg=;
 b=QpvenwTtI1SchFzESBtOUpatDMyd0AIcPNZoLB7+jy1M3bO/p+0EDYbFlb1eTLM1RBdMK5u7DPtcKKqVqj5p9ESkUZOJE3hiqReghwvxiJbf7N8cPlFjq2or57vD/fS0hzpClbetz8cHj3bSs/+aNUXgW5Ms3rgVKvnWnZ+xpOOkxjaGPdPgi229DjjwTOOOZ6wtushiwBtbgDV6je0NJU6LzaFBP3w6WgZ0DbuudzqbKzKPZZG0uHTmyUDUBELQyzEfxBCjGRNlymuD91DQDl/6+Ygi4S5oT/4zMO7WCl4DPoLbyjb61KrO6cN1x2kRNq2bPvKv7JQ2CjjY6q0cBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0086.namprd12.prod.outlook.com (2603:10b6:0:57::30) by
 MN2PR12MB3519.namprd12.prod.outlook.com (2603:10b6:208:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12; Thu, 1 Aug
 2019 06:54:50 +0000
Received: from BY2NAM03FT060.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM3PR12CA0086.outlook.office365.com
 (2603:10b6:0:57::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15 via Frontend
 Transport; Thu, 1 Aug 2019 06:54:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT060.mail.protection.outlook.com (10.152.85.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:54:49 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:54:47 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: update the calc algorithm of umc ecc error
 count
Date: Thu, 1 Aug 2019 14:53:41 +0800
Message-ID: <20190801065342.8450-4-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801065342.8450-1-tao.zhou1@amd.com>
References: <20190801065342.8450-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(53936002)(11346002)(2616005)(76176011)(126002)(426003)(7696005)(51416003)(336012)(50226002)(486006)(70206006)(86362001)(476003)(48376002)(70586007)(6666004)(356004)(6636002)(2201001)(47776003)(26005)(186003)(446003)(53416004)(4326008)(81166006)(81156014)(8676002)(8936002)(5660300002)(36756003)(50466002)(1076003)(305945005)(2906002)(68736007)(316002)(110136005)(16586007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3519; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5eb0c4c-aba9-45dc-7248-08d7164d25e1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3519; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3519:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3519CC82C1A6FE1E08201138B0DE0@MN2PR12MB3519.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RorqgStsv5LAAPCc2LqdA920R8s2zrweNjWU9hsiFo6C9VNVUiyDxMeuzXetIcjWi5Zmcj9c68eW+apsaJod27eKu4o+zA4NIszsYMkrE/Ey3sUtqS7rqSZGC5qp1PiQGSWKtFGdSvr1uhwF7PafcE/08qOq6NFR33OopFqToxfwXmJkzxczxfjVVAdS805vzLo0mHlCwicm+x+iyFnDOPBoaS4kauNnb1DoS/I2t+wzfDF69PLvf1rzRyIu5vwaMQxw6xFgot8fEzBymeLV/Kdiquo4mwH++8wMqexU9rT0aKKyh9n//7Jg2OeBmrXj8nxYS7sxYhjIVtCCcroM/KYISuv3laq4/x0wWzNDRon/ZHbcUnOpDj3UQGi/s886M7JMkrwZ5f+CS6cxu9MsZ4Yk5ok30CaqWb2bMqRzPA4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:54:49.8457 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5eb0c4c-aba9-45dc-7248-08d7164d25e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsjRnTcitQTpyIBkXg99w8C+TGuCi2nMd5Z06r1VRIg=;
 b=oeKR4hzyo/FKw7PXxPUZZ0yNHSs10++mJ9+novoSvs201u2Hp4pB223bHfiAM0A24SzOVnterkqrw5EB3reXEX6uy3ThWu2zSCP9QNRZZLHxy69y2rd+TMeQ4ITvgU+Tkc5bS7w+s567duVnYA7pifLRYCYg2AvHIbghOAmdpDY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dGhlIGluaXRpYWwgdmFsdWUgb2YgZWNjIGVycm9yIGNvdW50IGNhbiBiZSBhZGp1c3RlZAoKU2ln
bmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS91bWNfdjZfMS5jCmluZGV4IDgyMzUzZjc0OTM3NC4uYTFkZTZmNWEyMzc0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKQEAgLTk4LDkgKzk4LDEwIEBAIHN0YXRpYyB2b2lk
IHVtY192Nl8xX3F1ZXJ5X2NvcnJlY3RhYmxlX2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAogCVdSRUczMihlY2NfZXJyX2NudF9zZWxfYWRkciArIHVtY19yZWdfb2Zmc2V0
LCBlY2NfZXJyX2NudF9zZWwpOwogCWVjY19lcnJfY250ID0gUlJFRzMyKGVjY19lcnJfY250X2Fk
ZHIgKyB1bWNfcmVnX29mZnNldCk7CiAJKmVycm9yX2NvdW50ICs9Ci0JCVJFR19HRVRfRklFTEQo
ZWNjX2Vycl9jbnQsIFVNQ0NIMF8wX0VjY0VyckNudCwgRWNjRXJyQ250KTsKKwkJKFJFR19HRVRf
RklFTEQoZWNjX2Vycl9jbnQsIFVNQ0NIMF8wX0VjY0VyckNudCwgRWNjRXJyQ250KSAtCisJCSBV
TUNfVjZfMV9DRV9DTlRfSU5JVCk7CiAJLyogY2xlYXIgdGhlIGxvd2VyIGNoaXAgZXJyIGNvdW50
ICovCi0JV1JFRzMyKGVjY19lcnJfY250X2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMCk7CisJV1JF
RzMyKGVjY19lcnJfY250X2FkZHIgKyB1bWNfcmVnX29mZnNldCwgVU1DX1Y2XzFfQ0VfQ05UX0lO
SVQpOwogCiAJLyogc2VsZWN0IHRoZSBoaWdoZXIgY2hpcCBhbmQgY2hlY2sgdGhlIGVyciBjb3Vu
dGVyICovCiAJZWNjX2Vycl9jbnRfc2VsID0gUkVHX1NFVF9GSUVMRChlY2NfZXJyX2NudF9zZWws
IFVNQ0NIMF8wX0VjY0VyckNudFNlbCwKQEAgLTEwOCw5ICsxMDksMTAgQEAgc3RhdGljIHZvaWQg
dW1jX3Y2XzFfcXVlcnlfY29ycmVjdGFibGVfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJV1JFRzMyKGVjY19lcnJfY250X3NlbF9hZGRyICsgdW1jX3JlZ19vZmZzZXQs
IGVjY19lcnJfY250X3NlbCk7CiAJZWNjX2Vycl9jbnQgPSBSUkVHMzIoZWNjX2Vycl9jbnRfYWRk
ciArIHVtY19yZWdfb2Zmc2V0KTsKIAkqZXJyb3JfY291bnQgKz0KLQkJUkVHX0dFVF9GSUVMRChl
Y2NfZXJyX2NudCwgVU1DQ0gwXzBfRWNjRXJyQ250LCBFY2NFcnJDbnQpOworCQkoUkVHX0dFVF9G
SUVMRChlY2NfZXJyX2NudCwgVU1DQ0gwXzBfRWNjRXJyQ250LCBFY2NFcnJDbnQpIC0KKwkJVU1D
X1Y2XzFfQ0VfQ05UX0lOSVQpOwogCS8qIGNsZWFyIHRoZSBoaWdoZXIgY2hpcCBlcnIgY291bnQg
Ki8KLQlXUkVHMzIoZWNjX2Vycl9jbnRfYWRkciArIHVtY19yZWdfb2Zmc2V0LCAwKTsKKwlXUkVH
MzIoZWNjX2Vycl9jbnRfYWRkciArIHVtY19yZWdfb2Zmc2V0LCBVTUNfVjZfMV9DRV9DTlRfSU5J
VCk7CiAKIAkvKiBjaGVjayBmb3IgU1JBTSBjb3JyZWN0YWJsZSBlcnJvcgogCSAgTUNVTUNfU1RB
VFVTIGlzIGEgNjQgYml0IHJlZ2lzdGVyICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
