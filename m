Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640B7DAB9
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00396E55E;
	Thu,  1 Aug 2019 11:55:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15046E55A
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjowCKgYLwZ9a4WOPM7B5QxkRVn5whU9Sjz3FdXcWF1AKxx0WwuaInp5M+s335AffsMrjfthry6907dplQn+ru7EPn42yWAG8sezZqcd1KT/Xvo9J3K4Ay/wlIF3LPGhSAOli0EqN6DfHpakKgL/xgc+Y/vxai9YMfBzDWyTNqgA8CrwGViIGpzngy1tZ9gvMaUDPv8Mm7fvx0C1cuadPSw3U6lHGi7to0hBNBY01FF0Gw+v36NZqDDnp7Tb+fsDCRSD1s/+2+P2weOQkmsh3f+/fA3ZuTk6R+qqWNNJyuj/ek4gczbTseCVEBXxrK+zMcjTIo2sksICVDO4aBTyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Yfcyz67WF96F1p+xnXxju2e2Jyo9TwqTAec0sEggo=;
 b=Bt/TxES/IZPLTBCENfqmqro/EUj5WOMmoaqyZfAwAdsy4W+pgwTPp7jvwBP3RnemB82IPjJduILVNRSdU3tC8hykMlnXFTLBtmXfhAeo0CcFomROdaZMxsPXGTqodtugDyRT2IjPjHLNmEMgbca/hGO050h8PT+ADSXSFecA4GXwlPcbgb+YtmIi8it+MXhtZAN6kXQevp+IV7vN0l/UFL0N+rJrRKPH+KkkVea3IJMV2699lLSWWMS1OFojTl0IS1hL37Z2wOYaH/ts36LwEZQj8v4gYZDhWHMURdVmAjGVX2FreqcpF+H+GL4JW/2vv00Wl5X7Pc1fKNIfYZEJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:610:57::27)
 by BL0PR12MB2531.namprd12.prod.outlook.com (2603:10b6:207:3f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Thu, 1 Aug
 2019 11:55:43 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by CH2PR12CA0017.outlook.office365.com
 (2603:10b6:610:57::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15 via Frontend
 Transport; Thu, 1 Aug 2019 11:55:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 11:55:42 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 06:55:39 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 3/5] drm/amdgpu: update the calc algorithm of umc ecc error
 count
Date: Thu, 1 Aug 2019 19:54:52 +0800
Message-ID: <20190801115454.21867-4-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801115454.21867-1-tao.zhou1@amd.com>
References: <20190801115454.21867-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(476003)(2616005)(11346002)(356004)(336012)(486006)(126002)(47776003)(68736007)(81166006)(50226002)(8936002)(8676002)(5660300002)(6636002)(426003)(81156014)(4326008)(70586007)(86362001)(53936002)(1076003)(446003)(6666004)(305945005)(186003)(51416003)(48376002)(53416004)(2906002)(70206006)(16586007)(478600001)(316002)(110136005)(76176011)(7696005)(36756003)(50466002)(26005)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2531; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca7f8dcb-40bb-4d90-55ee-08d716772df2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BL0PR12MB2531; 
X-MS-TrafficTypeDiagnostic: BL0PR12MB2531:
X-Microsoft-Antispam-PRVS: <BL0PR12MB253120865B187B2639AB93A9B0DE0@BL0PR12MB2531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: DtrMkuUlH8QlqnFNUa4TCzZ3gB+2mNJ7CD1un1Q72CgviMGi7ZHa5epQ8T0gM3xRsgT/fI8poThaZJQzTi55snHjU/M+nBuuBD4NixjRM7cGnp0lJxNVerAI1pZnteF2qdjXZLOru0kWt8nuXHPM7oQIMTOjZSgOiSXkb68DA8DTkmeaFjHRRh+CGAMOlY212c7z9G6i82KiTueLxiIQzhJ9lytOzdpYtv9QqFxuJLKEkd6nDm2W0jVBSXPdOjbPYp2tTyAzgbD7uIU2M3RkBD88hpFXJ38cRpDREa/YhwXka01iHeInEQ+yhmgRGyvrqNKMG9bDMfILjqSAyoNCyA8RmHVpz5JWGq8Q1PcRRdcSt8MqQWXkebYVL7yTYZQi8tDYUeWs8EjZ4PrxbJHYyYv9Jt5mSv3kKR5trI932Gs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:55:42.2348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7f8dcb-40bb-4d90-55ee-08d716772df2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2531
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9Yfcyz67WF96F1p+xnXxju2e2Jyo9TwqTAec0sEggo=;
 b=tZf9KOXCXr2XOuuox1YTBqJXcm+4ZW9jphqgOmJQteESiGrnz5f4jyMvX8KNWqDewiNkdJRBgoh6ETfQCB7m07KWNcEY2cpbj25udUUbgFTgTYrj6VqB4TBnVqfx0zLIpe4QKeR3KkhlTDbbxIiXUW4wVx8UnfrtL4BZgXI44Kw=
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
dS91bWNfdjZfMS5jCmluZGV4IDBhYjJlOTZiNGY3Ny4uMDM0Yjc4NjkxMTI4IDEwMDY0NAotLS0g
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
