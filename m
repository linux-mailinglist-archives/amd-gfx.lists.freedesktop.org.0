Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4479A36BC
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 14:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412EF6E2D1;
	Fri, 30 Aug 2019 12:25:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758916E2D1
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 12:25:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLZlRjB1tZbRW7M1lfMfZ1ecbJRLPY4kQ+1AnL4io4XJLytLp+NnCDDhS3TsYupfCozW06CLw7vcWQDLZy3kHtprQyUziS3he6+qUOAGHp/78+kM1OBszwvY3R2ZjIk0kyzKmQMPUW+blrElIfG5Pp1t5BfSqSXHt1bTlTuOONhskUpA2h4hNWH8VVwiSmdCMmlrsfTNrh1JLk0BnvdcwcKRPvdwQo4NsGKW0iGeoHZO9bJpuF5xkFFxG1ZNcjLZKNTbQTZ0ZlzI4XcyOyseMphcIn1yHdmdWTdoIGlMUJkjsEhiXF/ONPUWr+VkDkMzTg50TVWd/FUfVr06mI3Xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yZVDdSK15OhEvStFojrIZV4FzuKzG3BdrFN4S3seKk=;
 b=JO+lSTPl3LnUraiSsHK6jkr+ajdug2R7HSRZVNG07SnMcUucPGrFfkAMW8orKDJf6q6LGrFcIVHcnFhVSz1s3Eg69y1LiF0kY3w40S6Td4psp0ZTu5L/Ta4S8DbqDOA+jZYN4pA3ePDT4mcgeD30tFhtJQYs+GeUiztcWjKf+QU4IMdBI9DyC+HpOTALXYIlF8bG1bLYb1YfHWhX5USy8dsBVLelgNrh3LnR//Lg89uLaFop8sjUBmgTCxo+YSYT3854zOZ/5zMie+j/VVLqiBOkLV+8G/5D/OtLugmrLH5n/CLfsg8K7GT/GomshNMVBfuGH+lelDwQp/Yyz3PcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0091.namprd12.prod.outlook.com (2603:10b6:0:55::11) by
 CH2PR12MB3944.namprd12.prod.outlook.com (2603:10b6:610:2d::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 12:25:29 +0000
Received: from CO1NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0091.outlook.office365.com
 (2603:10b6:0:55::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 12:25:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT012.mail.protection.outlook.com (10.152.80.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 12:25:28 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 07:25:28 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <andrey.grodzovsky@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <hawking.zhang@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: change ras bps type to eeprom table record
 structure
Date: Fri, 30 Aug 2019 20:24:50 +0800
Message-ID: <20190830122453.19703-2-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830122453.19703-1-tao.zhou1@amd.com>
References: <20190830122453.19703-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(428003)(199004)(189003)(26005)(110136005)(7696005)(476003)(126002)(2616005)(8936002)(16586007)(336012)(50466002)(486006)(2201001)(6636002)(2906002)(446003)(48376002)(305945005)(316002)(14444005)(11346002)(4326008)(426003)(50226002)(70206006)(36756003)(76176011)(1076003)(8676002)(5660300002)(81166006)(81156014)(86362001)(478600001)(53416004)(51416003)(70586007)(356004)(186003)(53936002)(6666004)(47776003)(79990200002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3944; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92ec8bbf-932c-4ac4-becd-08d72d4524ed
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CH2PR12MB3944; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3944:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3944B263697EF45A0390754EB0BD0@CH2PR12MB3944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AFFD662amdhKLfPbgaPK5KZTkxK92cCumDFZgTane6CArzjyv+tojmbyO+g0lcq9h+ARMoCrxIaNXUDL0kXcG+BN6O+7liWTtv2k4cE4DxjSPFkDb4weY6OdwGqPy3xJ4VkDjQUSg/LVFolk8mOkRYewNWBr5XmOr0dqtraqKagKMzpRKFGf7rmRB/+uYR47xhH7bmQaOD/+75SjL4hmo3OVdF8XQKKGbeaRHUU+zrw1s3HUt29TS9adqei1qddEIwdj6O9fyqgAv3CD9MSW46Lx18j4pbspOmaWFtsLxA9x8BuRnCi9jrLclxPoPCtQlcbYRYiVDgnV5yD7iZnKbrYMZnhbYbWRhiQRJ7nzT60Gr9fdH98O3vF4xXAHXTWd2UxdZtrNhQECOOQQRJrmbDtvOFwIb3BMW+RobJlP/Pr1mQWLO+pJDTIluvZp0jUhAweSVfTRRb64pG4jRGZshg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 12:25:28.9997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ec8bbf-932c-4ac4-becd-08d72d4524ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3944
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yZVDdSK15OhEvStFojrIZV4FzuKzG3BdrFN4S3seKk=;
 b=vzu9dunpkBLXdJkYKXBSa8bDKERNlT08Dla36ne5sxEjMwndZaT1kGwYcVntJDmf7unVFkLNscDralJWHNpWw3vUxMlOSpMq5MC2VK8VrULLWpF3mip33dIP0bAnkCU+p5CJ+iZP887Zze50tDH275OMsKAIXxBSrEatGpoXhqM=
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

Y2hhbmdlIGJwcyB0eXBlIGZyb20gcmV0aXJlZCBwYWdlIHRvIGVlcHJvbSB0YWJsZSByZWNvcmQs
IHByZXBhcmUgZm9yCnNhdmluZyBlcnJvciByZWNvcmRzIHRvIGVlcHJvbQoKU2lnbmVkLW9mZi1i
eTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDU5ICsrKysrKysrKysrKysrKystLS0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDExICsrKy0tCiAyIGZpbGVzIGNo
YW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCAyY2EzOTk3ZDRiM2EuLjI0NjYzZWM0MTI0OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTE4NywxNCArMTE4
NywxNCBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfYmFkcGFnZXNfcmVhZChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKIAogCWZvciAoOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewogCQkoKmJw
cylbaV0gPSAoc3RydWN0IHJhc19iYWRwYWdlKXsKLQkJCS5icCA9IGRhdGEtPmJwc1tpXS5icCwK
KwkJCS5icCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2UsCiAJCQkuc2l6ZSA9IEFNREdQVV9H
UFVfUEFHRV9TSVpFLAogCQkJLmZsYWdzID0gMCwKIAkJfTsKIAogCQlpZiAoZGF0YS0+bGFzdF9y
ZXNlcnZlZCA8PSBpKQogCQkJKCpicHMpW2ldLmZsYWdzID0gMTsKLQkJZWxzZSBpZiAoZGF0YS0+
YnBzW2ldLmJvID09IE5VTEwpCisJCWVsc2UgaWYgKGRhdGEtPmJwc19ib1tpXSA9PSBOVUxMKQog
CQkJKCpicHMpW2ldLmZsYWdzID0gMjsKIAl9CiAKQEAgLTEyODgsMzAgKzEyODgsNDAgQEAgc3Rh
dGljIGludCBhbWRncHVfcmFzX3JlYWxsb2NfZWhfZGF0YV9zcGFjZShzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIHsKIAl1bnNpZ25lZCBpbnQgb2xkX3NwYWNlID0gZGF0YS0+Y291bnQgKyBk
YXRhLT5zcGFjZV9sZWZ0OwogCXVuc2lnbmVkIGludCBuZXdfc3BhY2UgPSBvbGRfc3BhY2UgKyBw
YWdlczsKLQl1bnNpZ25lZCBpbnQgYWxpZ25fc3BhY2UgPSBBTElHTihuZXdfc3BhY2UsIDEwMjQp
OwotCXZvaWQgKnRtcCA9IGttYWxsb2MoYWxpZ25fc3BhY2UgKiBzaXplb2YoKmRhdGEtPmJwcyks
IEdGUF9LRVJORUwpOwotCi0JaWYgKCF0bXApCisJdW5zaWduZWQgaW50IGFsaWduX3NwYWNlID0g
QUxJR04obmV3X3NwYWNlLCA1MTIpOworCXZvaWQgKmJwcyA9IGttYWxsb2MoYWxpZ25fc3BhY2Ug
KiBzaXplb2YoKmRhdGEtPmJwcyksIEdGUF9LRVJORUwpOworCXN0cnVjdCBhbWRncHVfYm8gKipi
cHNfYm8gPQorCQkJa21hbGxvYyhhbGlnbl9zcGFjZSAqIHNpemVvZigqZGF0YS0+YnBzX2JvKSwg
R0ZQX0tFUk5FTCk7CisKKwlpZiAoIWJwcyB8fCAhYnBzX2JvKSB7CisJCWtmcmVlKGJwcyk7CisJ
CWtmcmVlKGJwc19ibyk7CiAJCXJldHVybiAtRU5PTUVNOworCX0KIAogCWlmIChkYXRhLT5icHMp
IHsKLQkJbWVtY3B5KHRtcCwgZGF0YS0+YnBzLAorCQltZW1jcHkoYnBzLCBkYXRhLT5icHMsCiAJ
CQkJZGF0YS0+Y291bnQgKiBzaXplb2YoKmRhdGEtPmJwcykpOwogCQlrZnJlZShkYXRhLT5icHMp
OwogCX0KKwlpZiAoZGF0YS0+YnBzX2JvKSB7CisJCW1lbWNweShicHNfYm8sIGRhdGEtPmJwc19i
bywKKwkJCQlkYXRhLT5jb3VudCAqIHNpemVvZigqZGF0YS0+YnBzX2JvKSk7CisJCWtmcmVlKGRh
dGEtPmJwc19ibyk7CisJfQogCi0JZGF0YS0+YnBzID0gdG1wOworCWRhdGEtPmJwcyA9IGJwczsK
KwlkYXRhLT5icHNfYm8gPSBicHNfYm87CiAJZGF0YS0+c3BhY2VfbGVmdCArPSBhbGlnbl9zcGFj
ZSAtIG9sZF9zcGFjZTsKIAlyZXR1cm4gMDsKIH0KIAogLyogaXQgZGVhbCB3aXRoIHZyYW0gb25s
eS4gKi8KIGludCBhbWRncHVfcmFzX2FkZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCi0JCXVuc2lnbmVkIGxvbmcgKmJwcywgaW50IHBhZ2VzKQorCQlzdHJ1Y3QgZWVwcm9t
X3RhYmxlX3JlY29yZCAqYnBzLCBpbnQgcGFnZXMpCiB7CiAJc3RydWN0IGFtZGdwdV9yYXMgKmNv
biA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7CiAJc3RydWN0IHJhc19lcnJfaGFuZGxl
cl9kYXRhICpkYXRhOwotCWludCBpID0gcGFnZXM7CiAJaW50IHJldCA9IDA7CiAKIAlpZiAoIWNv
biB8fCAhY29uLT5laF9kYXRhIHx8ICFicHMgfHwgcGFnZXMgPD0gMCkKQEAgLTEzMjgsMTAgKzEz
MzgsMTAgQEAgaW50IGFtZGdwdV9yYXNfYWRkX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAkJCWdvdG8gb3V0OwogCQl9CiAKLQl3aGlsZSAoaS0tKQotCQlkYXRhLT5icHNb
ZGF0YS0+Y291bnQrK10uYnAgPSBicHNbaV07Ci0KKwltZW1jcHkoJmRhdGEtPmJwc1tkYXRhLT5j
b3VudF0sIGJwcywgcGFnZXMgKiBzaXplb2YoKmRhdGEtPmJwcykpOworCWRhdGEtPmNvdW50ICs9
IHBhZ2VzOwogCWRhdGEtPnNwYWNlX2xlZnQgLT0gcGFnZXM7CisKIG91dDoKIAltdXRleF91bmxv
Y2soJmNvbi0+cmVjb3ZlcnlfbG9jayk7CiAKQEAgLTEzNTYsMTMgKzEzNjYsMTMgQEAgaW50IGFt
ZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJ
CWdvdG8gb3V0OwogCS8qIHJlc2VydmUgdnJhbSBhdCBkcml2ZXIgcG9zdCBzdGFnZS4gKi8KIAlm
b3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewotCQli
cCA9IGRhdGEtPmJwc1tpXS5icDsKKwkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJlZF9wYWdlOwog
CiAJCWlmIChhbWRncHVfcmFzX3Jlc2VydmVfdnJhbShhZGV2LCBicCA8PCBQQUdFX1NISUZULAog
CQkJCQlQQUdFX1NJWkUsICZibykpCiAJCQlEUk1fRVJST1IoIlJBUyBFUlJPUjogcmVzZXJ2ZSB2
cmFtICVsbHggZmFpbFxuIiwgYnApOwogCi0JCWRhdGEtPmJwc1tpXS5ibyA9IGJvOworCQlkYXRh
LT5icHNfYm9baV0gPSBibzsKIAkJZGF0YS0+bGFzdF9yZXNlcnZlZCA9IGkgKyAxOwogCX0KIG91
dDoKQEAgLTEzODcsMTEgKzEzOTcsMTEgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlbGVhc2Vf
YmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlnb3RvIG91dDsKIAogCWZv
ciAoaSA9IGRhdGEtPmxhc3RfcmVzZXJ2ZWQgLSAxOyBpID49IDA7IGktLSkgewotCQlibyA9IGRh
dGEtPmJwc1tpXS5ibzsKKwkJYm8gPSBkYXRhLT5icHNfYm9baV07CiAKIAkJYW1kZ3B1X3Jhc19y
ZWxlYXNlX3ZyYW0oYWRldiwgJmJvKTsKIAotCQlkYXRhLT5icHNbaV0uYm8gPSBibzsKKwkJZGF0
YS0+YnBzX2JvW2ldID0gYm87CiAJCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpOwogCX0KIG91dDoK
QEAgLTE0MDcsMTIgKzE0MTcsMTkgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3NhdmVfYmFkX3Bh
Z2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCisvKgorICog
cmVhZCBlcnJvciByZWNvcmQgYXJyYXkgaW4gZWVwcm9tIGFuZCByZXNlcnZlIGVub3VnaCBzcGFj
ZSBmb3IKKyAqIHN0b3JpbmcgbmV3IGJhZCBwYWdlcworICovCiBzdGF0aWMgaW50IGFtZGdwdV9y
YXNfbG9hZF9iYWRfcGFnZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7Ci0JLyogVE9E
TwotCSAqIHJlYWQgdGhlIGFycmF5IHRvIGVlcHJvbSB3aGVuIFNNVSBkaXNhYmxlZC4KLQkgKi8K
LQlyZXR1cm4gMDsKKwlzdHJ1Y3QgZWVwcm9tX3RhYmxlX3JlY29yZCAqYnBzID0gTlVMTDsKKwlp
bnQgcmV0OworCisJcmV0ID0gYW1kZ3B1X3Jhc19hZGRfYmFkX3BhZ2VzKGFkZXYsIGJwcywKKwkJ
CQlhZGV2LT51bWMubWF4X3Jhc19lcnJfY250X3Blcl9xdWVyeSk7CisKKwlyZXR1cm4gcmV0Owog
fQogCiBzdGF0aWMgaW50IGFtZGdwdV9yYXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAppbmRleCA2
NmI3MTUyNTQ0NmUuLmI2YmFjODczYzU4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuaApAQCAtMzUxLDExICszNTEsMTAgQEAgc3RydWN0IHJhc19lcnJfZGF0YSB7CiB9
OwogCiBzdHJ1Y3QgcmFzX2Vycl9oYW5kbGVyX2RhdGEgewotCS8qIHBvaW50IHRvIGJhZCBwYWdl
cyBhcnJheSAqLwotCXN0cnVjdCB7Ci0JCXVuc2lnbmVkIGxvbmcgYnA7Ci0JCXN0cnVjdCBhbWRn
cHVfYm8gKmJvOwotCX0gKmJwczsKKwkvKiBwb2ludCB0byBiYWQgcGFnZSByZWNvcmRzIGFycmF5
ICovCisJc3RydWN0IGVlcHJvbV90YWJsZV9yZWNvcmQgKmJwczsKKwkvKiBwb2ludCB0byByZXNl
cnZlZCBibyBhcnJheSAqLworCXN0cnVjdCBhbWRncHVfYm8gKipicHNfYm87CiAJLyogdGhlIGNv
dW50IG9mIGVudHJpZXMgKi8KIAlpbnQgY291bnQ7CiAJLyogdGhlIHNwYWNlIGNhbiBwbGFjZSBu
ZXcgZW50cmllcyAqLwpAQCAtNDkyLDcgKzQ5MSw3IEBAIHVuc2lnbmVkIGxvbmcgYW1kZ3B1X3Jh
c19xdWVyeV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogLyogZXJy
b3IgaGFuZGxpbmcgZnVuY3Rpb25zICovCiBpbnQgYW1kZ3B1X3Jhc19hZGRfYmFkX3BhZ2VzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQl1bnNpZ25lZCBsb25nICpicHMsIGludCBwYWdl
cyk7CisJCXN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpicHMsIGludCBwYWdlcyk7CiAKIGlu
dCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
