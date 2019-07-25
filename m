Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F6750FA
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 16:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351D26E65C;
	Thu, 25 Jul 2019 14:25:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9815F6E65C
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 14:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjmDDNt9Pww8f9VdGnCL58TofTPJehjwO7BKalWcVxqyw+j2WGT+a8N1FtldDv/439z+ZflHm2huZ2iZcW70NsU8oB0/GCIETUBgqVj8G0HWUcjbUcrwmVsB8dlkKkK2kkvXXZdL6UFrbKGqcaZiOISakp/I4Wevy+/c3H6zYV+DqoSN5ZaY1Ko6kq2AD1hMIgbtdVmSdu4NCN3yyOWc77FkrS6ZwC79vwz22ig3r/VUrmvze/N72ckNgXp1jBDydXKr1LDgXqBVxIrDYKxaOKQi7EBgjtNHs1hmfqdESL6g2Hw5LU12Vc56xsh7C72jpx35fFIoMBVpAqViIwam7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdnr6u+8yZN0uhOlw+W5toGoLgIJW+IJvM1vpeBF+kI=;
 b=FHt6mZVAFamPslUUlwOq+07mdfDiYrxfCK8xRGe0B7W1f+GlXKWo6/c1VGHjoeCd5krbbnH2j96daKXAI+3G2ZfnwxyV2EUAVnt68JY/J8tPy7Cm3idTL/egN5SZ11m7I5dYZZnYRrCntF/0U8Ghs01gsrB8t1S0yA44n//zwnPQTXyY5I9LgACBuGZURlYaLUuVn6yw8TGIuQzgqboWbvVnFdyEBi5sc09C3NpUAs3HNlbsAF6ywOJP5Ct/5E4E9q/KyH6iE0tyO6VCRyxuTswjMR/ODYHcDgrJSIY9FMxvlEsT3xowfiWN97Vsf/a3ci1QJ6l9SIDdserL/MYWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=daenzer.net
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0051.namprd12.prod.outlook.com (2603:10b6:300:103::13)
 by DM5PR12MB1305.namprd12.prod.outlook.com (2603:10b6:3:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15; Thu, 25 Jul
 2019 14:25:17 +0000
Received: from CO1NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MWHPR12CA0051.outlook.office365.com
 (2603:10b6:300:103::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16 via Frontend
 Transport; Thu, 25 Jul 2019 14:25:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT003.mail.protection.outlook.com (10.152.80.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 14:25:16 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 25 Jul 2019 09:25:15 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 3/4] drm/amdgpu: Add check for USWC support for
 amdgpu_display_supported_domains
Date: Thu, 25 Jul 2019 10:24:42 -0400
Message-ID: <1564064683-31796-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(199004)(189003)(446003)(6916009)(305945005)(186003)(336012)(50466002)(4326008)(476003)(126002)(48376002)(426003)(2616005)(14444005)(11346002)(44832011)(486006)(68736007)(81156014)(81166006)(76176011)(2351001)(478600001)(47776003)(86362001)(53416004)(16586007)(54906003)(36756003)(5660300002)(8936002)(70206006)(6666004)(356004)(70586007)(50226002)(8676002)(26005)(2906002)(7696005)(53936002)(316002)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1305; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2cbbe86-498d-467c-21ea-08d7110bea2e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1305; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1305:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1305E24BF656792AECE3DBA9EAC10@DM5PR12MB1305.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SdOdgCnw2XPAVlAEwXazXuIl2FL5SUh0DIKFdWpM9SCKgHJXheYU26HCCe73wqHJqFtRK9LjlxeqTZkbfCI59jLjc/rn9SdxSKphrm7NDYpUS10uSpBVyGV98nDsM9vcrMN956T5+8fxDqOXSgfD4bNSLOQpWkVSyc6Q4z6w1iBM1DxnSCRCuuEfqmIZqfvW0XuaV/Qo4FQhxp1b4bxF1ZCge9wrAADK8u2yKWPpKfc43BqRVTjgKGpvcjGoQ3E616En3xw1pgVpAGb1e+V0Qq152gd1pc7EhRjEdcvlfGQueI+4JmpoExXdLXi/Uci0wfOwDQA5817VnpfdRLHKMDprdqjMFifgdLdwjO7S2SEq9S/L7vYuXmYQRMLQDpjwuCKSckbJIrGp9R6jZH6V5v5TK5WfUCUJKw54X0WNUrs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 14:25:16.5487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cbbe86-498d-467c-21ea-08d7110bea2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdnr6u+8yZN0uhOlw+W5toGoLgIJW+IJvM1vpeBF+kI=;
 b=WWUU4PW3yYhW0lDiRf1n7iL1r5hqYdVWmGisdjK67y9Ss344/IpeXtmfcaPIWMecqt9ZqQo3zY0duY2vcMgWnrxESZzSqwAJ0vnMaI5UZmjXZoLoGLub8842fGMLhof8PbG7SE+LyysiGiln8gJtUfoP3cacGnPh4t/IaBugs50=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, michel@daenzer.net,
 shirish.s@amd.com, hersenxs.wu@amd.com, Alexander.Deucher@amd.com,
 Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB2ZXJpZmllcyB3ZSBkb24ndCBhZGQgR1RUIGFzIGFsbG93ZWQgZG9tbmFpbiBmb3IgQVBV
cyB3aGVuIFVTV0MKaXMgZGlzYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNr
eSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzcGxheS5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rpc3BsYXkuYwppbmRleCA3NjdlZTY5OS4uY2FjOTk3NSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCkBAIC00OTgsOCArNDk4LDE1IEBAIHVp
bnQzMl90IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCXVpbnQzMl90IGRvbWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU07CiAK
ICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQorCS8qCisJICogaWYgYW1kZ3B1X2JvX3Zh
bGlkYXRlX3Vzd2MgcmV0dXJucyBmYWxzZSBpdCBtZWFucyB0aGF0IFVTV0MgbWFwcGluZ3MKKwkg
KiBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGlzIGJvYXJkLiBCdXQgdGhpcyBtYXBwaW5nIGlzIHJl
cXVpcmVkCisJICogdG8gYXZvaWQgaGFuZyBjYXVzZWQgYnkgcGxhY2VtZW50IG9mIHNjYW5vdXQg
Qk8gaW4gR1RUIG9uIGNlcnRhaW4KKwkgKiBBUFVzLiBTbyBmb3JjZSB0aGUgQk8gcGxhY2VtZW50
IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFyY2hpdGVjdHVyZQorCSAqIHdpbGwgbm90IGFsbG93IFVT
V0MgbWFwcGluZ3MuCisJICovCiAJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8g
JiYgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiAmJgotCSAgICBhZGV2LT5mbGFncyAmIEFN
RF9JU19BUFUgJiYKKwkgICAgYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVICYmIGFtZGdwdV9ib19z
dXBwb3J0X3Vzd2MoMCkgJiYKIAkgICAgYW1kZ3B1X2RldmljZV9hc2ljX2hhc19kY19zdXBwb3J0
KGFkZXYtPmFzaWNfdHlwZSkpCiAJCWRvbWFpbiB8PSBBTURHUFVfR0VNX0RPTUFJTl9HVFQ7CiAj
ZW5kaWYKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
