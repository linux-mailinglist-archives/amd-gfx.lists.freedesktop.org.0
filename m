Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E671D2D875F
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Dec 2020 16:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6760C6E866;
	Sat, 12 Dec 2020 15:46:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6413D6E865
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Dec 2020 15:46:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai9G7SFM2UUxhPAaSuugLTxPALBNecw23TxEbITQdQDdHEvJgfjZX7gvZHU8wrGwE0k1HTqXmHYRAuUCzQSd66SyB/x7wavX+AENSrrcyC4HCrDOVFqipFnfLedG6x2DPWA6ezbeJrgcggQ67imAQbcROCwKTewjNiynMiQJAnHmdAKrAyjSQtAUzqzP0JpzMQTfngyx2REp6JOidHGHq2Qah4M3u+E6gwl/K4akIYKTVShlo4g+fz+6hEl7aXcpoVA1EQrMrYq7FGcU3AVUkoXak1c9Gm3q7AWCSIEjhx0bCu6zPXyqPTiDJYyouCLPTUt4Epu7SemKc/x08rYyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0LZ22t22YpRHfCJc6dzPmstxTIQYcMs2wLRdadsT9Y=;
 b=a2jz0htyfsXgtjEjRQg6icsOQGbiuCfINYT+azYrYBWEnbsVrh389fxKatkIcYR36d4n4tf4E2L6dMyskgwvBCQsHXnLBUbPG91cun/awPLKgJKUtVWZ8LbVpVK1f1Yh1YKm0mPY2F38IaWyyOZI00DA4hNT+Quv6tXb+zB+Dn+Nj6oUru7rnnQmvrcKn8/q+xPdE4Vh9mNCToCPS2pgAHug9FpH+BNd2pg099SWMZxDyK+kSHTAgisdTwONlLMvxUy/ivabKb8cvH4pTO5sGtFS/B3cAlHikHu3T6PB5XJlezlKp4IbfFREZr90/lfOf0gfIb+jkRSkcC4bQVx9yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0LZ22t22YpRHfCJc6dzPmstxTIQYcMs2wLRdadsT9Y=;
 b=dR00lVpXgSzyF6wZzTG5QbLu1uRNLdA3vAOfmR8stcMZeAN3uALZRJXPZVm3OV4pgX9PLk+oI8G5fuVMZX6TZFmUK4hP6A4TBgnn+FUQb2XWQmuuuBPaydIIGe9k/LtsG77lJEaMGsW4uSI7DeI23Ai87Wjc/jTio3QRAxpWkUc=
Received: from BN9PR03CA0206.namprd03.prod.outlook.com (2603:10b6:408:f9::31)
 by DM6PR12MB4354.namprd12.prod.outlook.com (2603:10b6:5:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Sat, 12 Dec
 2020 15:46:31 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::38) by BN9PR03CA0206.outlook.office365.com
 (2603:10b6:408:f9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13 via Frontend
 Transport; Sat, 12 Dec 2020 15:46:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.20 via Frontend Transport; Sat, 12 Dec 2020 15:46:30 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sat, 12 Dec
 2020 09:46:25 -0600
Received: from hawzhang-System-Product-Dev.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Sat, 12 Dec 2020 09:46:23 -0600
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Felix Kuehling <Felix.Kuehling@amd.com>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Feifei Xu
 <Feifei.Xu@amd.com>, Dennis Li <Dennis.Li@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH 06/27] drm/amdgpu: switch to ih_toggle_interrupts for vega10
Date: Sat, 12 Dec 2020 23:45:39 +0800
Message-ID: <20201212154600.21618-6-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201212154600.21618-1-Hawking.Zhang@amd.com>
References: <20201212154600.21618-1-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc36e427-cfcf-4f37-0766-08d89eb5187d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4354:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4354305884BB443997114CD4FCC90@DM6PR12MB4354.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PL/FOiC1LGLwFdy+85hw4IJC+YFCFIrMSH1B3iySzwpaHVSbV5Fjvur9XQoYlrJHXASSIRB4seoSZL+mSeJbzHFye5YMVgA9FN3fmpB42wdR1a4zGNr3LGK0yQLYJ3KYSY7qmnJjQN8/1l1DNme8fzSh3INrS1e8mXMAtzLHn8P6FfU4xN/QnRbm40qrHFzPaGhShUZLdTEc3hjWp464fVUcQj7emCltdXE4ySWYKpoV0Fn0IboH6xHoOxZZiNjFWu98fCldNIA5kIkDt1UJicPflLsauiFTPCVQMwXHczPebu0dmK4wYEQ56wMAHbFhsGAQXBZNjai4jGn8aspUmwybHhBke0h8Wky3B5+LSnnnMLD1j6hKu6Aqu7cQf4Bq+lxOcHGiiC4MbVm1tgJ3aQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(46966005)(83380400001)(70206006)(356005)(4326008)(6666004)(6636002)(186003)(70586007)(82310400003)(336012)(2616005)(36756003)(26005)(508600001)(66574015)(110136005)(7696005)(86362001)(5660300002)(8676002)(2906002)(8936002)(81166007)(1076003)(47076004)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2020 15:46:30.9591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc36e427-cfcf-4f37-0766-08d89eb5187d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4354
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVwbGFjZSBpaF9lbmFibGVfaW50ZXJydXB0cyBhbmQgaWhfZGlzYWJsZV9pbnRlcnJ1cHRzCndp
dGggaWhfdG9nZ2xlX2ludGVycnVwdHMKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMgfCAxNjggKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEzNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jCmluZGV4IGUyNGVlYzkyMTdkNi4u
NzI2ZDk1ODU0MGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdh
MTBfaWguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYwpAQCAt
ODQsMTM1ICs4NCw2IEBAIHN0YXRpYyB2b2lkIHZlZ2ExMF9paF9pbml0X3JlZ2lzdGVyX29mZnNl
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl9CiB9CiAKLS8qKgotICogdmVnYTEwX2lo
X2VuYWJsZV9pbnRlcnJ1cHRzIC0gRW5hYmxlIHRoZSBpbnRlcnJ1cHQgcmluZyBidWZmZXIKLSAq
Ci0gKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCi0gKgotICogRW5hYmxlIHRoZSBpbnRl
cnJ1cHQgcmluZyBidWZmZXIgKFZFR0ExMCkuCi0gKi8KLXN0YXRpYyB2b2lkIHZlZ2ExMF9paF9l
bmFibGVfaW50ZXJydXB0cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKLXsKLQl1MzIgaWhf
cmJfY250bCA9IFJSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfQ05UTCk7Ci0KLQlpaF9y
Yl9jbnRsID0gUkVHX1NFVF9GSUVMRChpaF9yYl9jbnRsLCBJSF9SQl9DTlRMLCBSQl9FTkFCTEUs
IDEpOwotCWloX3JiX2NudGwgPSBSRUdfU0VUX0ZJRUxEKGloX3JiX2NudGwsIElIX1JCX0NOVEws
IEVOQUJMRV9JTlRSLCAxKTsKLQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7Ci0JCWlmIChw
c3BfcmVnX3Byb2dyYW0oJmFkZXYtPnBzcCwgUFNQX1JFR19JSF9SQl9DTlRMLCBpaF9yYl9jbnRs
KSkgewotCQkJRFJNX0VSUk9SKCJQU1AgcHJvZ3JhbSBJSF9SQl9DTlRMIGZhaWxlZCFcbiIpOwot
CQkJcmV0dXJuOwotCQl9Ci0JfSBlbHNlIHsKLQkJV1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1J
SF9SQl9DTlRMLCBpaF9yYl9jbnRsKTsKLQl9Ci0JYWRldi0+aXJxLmloLmVuYWJsZWQgPSB0cnVl
OwotCi0JaWYgKGFkZXYtPmlycS5paDEucmluZ19zaXplKSB7Ci0JCWloX3JiX2NudGwgPSBSUkVH
MzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX1JCX0NOVExfUklORzEpOwotCQlpaF9yYl9jbnRsID0g
UkVHX1NFVF9GSUVMRChpaF9yYl9jbnRsLCBJSF9SQl9DTlRMX1JJTkcxLAotCQkJCQkgICBSQl9F
TkFCTEUsIDEpOwotCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7Ci0JCQlpZiAocHNwX3Jl
Z19wcm9ncmFtKCZhZGV2LT5wc3AsIFBTUF9SRUdfSUhfUkJfQ05UTF9SSU5HMSwKLQkJCQkJCWlo
X3JiX2NudGwpKSB7Ci0JCQkJRFJNX0VSUk9SKCJwcm9ncmFtIElIX1JCX0NOVExfUklORzEgZmFp
bGVkIVxuIik7Ci0JCQkJcmV0dXJuOwotCQkJfQotCQl9IGVsc2UgewotCQkJV1JFRzMyX1NPQzE1
KE9TU1NZUywgMCwgbW1JSF9SQl9DTlRMX1JJTkcxLCBpaF9yYl9jbnRsKTsKLQkJfQotCQlhZGV2
LT5pcnEuaWgxLmVuYWJsZWQgPSB0cnVlOwotCX0KLQotCWlmIChhZGV2LT5pcnEuaWgyLnJpbmdf
c2l6ZSkgewotCQlpaF9yYl9jbnRsID0gUlJFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9D
TlRMX1JJTkcyKTsKLQkJaWhfcmJfY250bCA9IFJFR19TRVRfRklFTEQoaWhfcmJfY250bCwgSUhf
UkJfQ05UTF9SSU5HMiwKLQkJCQkJICAgUkJfRU5BQkxFLCAxKTsKLQkJaWYgKGFtZGdwdV9zcmlv
dl92ZihhZGV2KSkgewotCQkJaWYgKHBzcF9yZWdfcHJvZ3JhbSgmYWRldi0+cHNwLCBQU1BfUkVH
X0lIX1JCX0NOVExfUklORzIsCi0JCQkJCQlpaF9yYl9jbnRsKSkgewotCQkJCURSTV9FUlJPUigi
cHJvZ3JhbSBJSF9SQl9DTlRMX1JJTkcyIGZhaWxlZCFcbiIpOwotCQkJCXJldHVybjsKLQkJCX0K
LQkJfSBlbHNlIHsKLQkJCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfQ05UTF9SSU5H
MiwgaWhfcmJfY250bCk7Ci0JCX0KLQkJYWRldi0+aXJxLmloMi5lbmFibGVkID0gdHJ1ZTsKLQl9
Ci0KLQlpZiAoYWRldi0+aXJxLmloX3NvZnQucmluZ19zaXplKQotCQlhZGV2LT5pcnEuaWhfc29m
dC5lbmFibGVkID0gdHJ1ZTsKLX0KLQotLyoqCi0gKiB2ZWdhMTBfaWhfZGlzYWJsZV9pbnRlcnJ1
cHRzIC0gRGlzYWJsZSB0aGUgaW50ZXJydXB0IHJpbmcgYnVmZmVyCi0gKgotICogQGFkZXY6IGFt
ZGdwdV9kZXZpY2UgcG9pbnRlcgotICoKLSAqIERpc2FibGUgdGhlIGludGVycnVwdCByaW5nIGJ1
ZmZlciAoVkVHQTEwKS4KLSAqLwotc3RhdGljIHZvaWQgdmVnYTEwX2loX2Rpc2FibGVfaW50ZXJy
dXB0cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKLXsKLQl1MzIgaWhfcmJfY250bCA9IFJS
RUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfQ05UTCk7Ci0KLQlpaF9yYl9jbnRsID0gUkVH
X1NFVF9GSUVMRChpaF9yYl9jbnRsLCBJSF9SQl9DTlRMLCBSQl9FTkFCTEUsIDApOwotCWloX3Ji
X2NudGwgPSBSRUdfU0VUX0ZJRUxEKGloX3JiX2NudGwsIElIX1JCX0NOVEwsIEVOQUJMRV9JTlRS
LCAwKTsKLQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7Ci0JCWlmIChwc3BfcmVnX3Byb2dy
YW0oJmFkZXYtPnBzcCwgUFNQX1JFR19JSF9SQl9DTlRMLCBpaF9yYl9jbnRsKSkgewotCQkJRFJN
X0VSUk9SKCJQU1AgcHJvZ3JhbSBJSF9SQl9DTlRMIGZhaWxlZCFcbiIpOwotCQkJcmV0dXJuOwot
CQl9Ci0JfSBlbHNlIHsKLQkJV1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9DTlRMLCBp
aF9yYl9jbnRsKTsKLQl9Ci0KLQkvKiBzZXQgcnB0ciwgd3B0ciB0byAwICovCi0JV1JFRzMyX1NP
QzE1KE9TU1NZUywgMCwgbW1JSF9SQl9SUFRSLCAwKTsKLQlXUkVHMzJfU09DMTUoT1NTU1lTLCAw
LCBtbUlIX1JCX1dQVFIsIDApOwotCWFkZXYtPmlycS5paC5lbmFibGVkID0gZmFsc2U7Ci0JYWRl
di0+aXJxLmloLnJwdHIgPSAwOwotCi0JaWYgKGFkZXYtPmlycS5paDEucmluZ19zaXplKSB7Ci0J
CWloX3JiX2NudGwgPSBSUkVHMzJfU09DMTUoT1NTU1lTLCAwLCBtbUlIX1JCX0NOVExfUklORzEp
OwotCQlpaF9yYl9jbnRsID0gUkVHX1NFVF9GSUVMRChpaF9yYl9jbnRsLCBJSF9SQl9DTlRMX1JJ
TkcxLAotCQkJCQkgICBSQl9FTkFCTEUsIDApOwotCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYp
KSB7Ci0JCQlpZiAocHNwX3JlZ19wcm9ncmFtKCZhZGV2LT5wc3AsIFBTUF9SRUdfSUhfUkJfQ05U
TF9SSU5HMSwKLQkJCQkJCWloX3JiX2NudGwpKSB7Ci0JCQkJRFJNX0VSUk9SKCJwcm9ncmFtIElI
X1JCX0NOVExfUklORzEgZmFpbGVkIVxuIik7Ci0JCQkJcmV0dXJuOwotCQkJfQotCQl9IGVsc2Ug
ewotCQkJV1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9DTlRMX1JJTkcxLCBpaF9yYl9j
bnRsKTsKLQkJfQotCQkvKiBzZXQgcnB0ciwgd3B0ciB0byAwICovCi0JCVdSRUczMl9TT0MxNShP
U1NTWVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMSwgMCk7Ci0JCVdSRUczMl9TT0MxNShPU1NTWVMs
IDAsIG1tSUhfUkJfV1BUUl9SSU5HMSwgMCk7Ci0JCWFkZXYtPmlycS5paDEuZW5hYmxlZCA9IGZh
bHNlOwotCQlhZGV2LT5pcnEuaWgxLnJwdHIgPSAwOwotCX0KLQotCWlmIChhZGV2LT5pcnEuaWgy
LnJpbmdfc2l6ZSkgewotCQlpaF9yYl9jbnRsID0gUlJFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1J
SF9SQl9DTlRMX1JJTkcyKTsKLQkJaWhfcmJfY250bCA9IFJFR19TRVRfRklFTEQoaWhfcmJfY250
bCwgSUhfUkJfQ05UTF9SSU5HMiwKLQkJCQkJICAgUkJfRU5BQkxFLCAwKTsKLQkJaWYgKGFtZGdw
dV9zcmlvdl92ZihhZGV2KSkgewotCQkJaWYgKHBzcF9yZWdfcHJvZ3JhbSgmYWRldi0+cHNwLCBQ
U1BfUkVHX0lIX1JCX0NOVExfUklORzIsCi0JCQkJCQlpaF9yYl9jbnRsKSkgewotCQkJCURSTV9F
UlJPUigicHJvZ3JhbSBJSF9SQl9DTlRMX1JJTkcyIGZhaWxlZCFcbiIpOwotCQkJCXJldHVybjsK
LQkJCX0KLQkJfSBlbHNlIHsKLQkJCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfQ05U
TF9SSU5HMiwgaWhfcmJfY250bCk7Ci0JCX0KLQotCQkvKiBzZXQgcnB0ciwgd3B0ciB0byAwICov
Ci0JCVdSRUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfUlBUUl9SSU5HMiwgMCk7Ci0JCVdS
RUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfV1BUUl9SSU5HMiwgMCk7Ci0JCWFkZXYtPmly
cS5paDIuZW5hYmxlZCA9IGZhbHNlOwotCQlhZGV2LT5pcnEuaWgyLnJwdHIgPSAwOwotCX0KLX0K
LQogLyoqCiAgKiB2ZWdhMTBfaWhfdG9nZ2xlX3JpbmdfaW50ZXJydXB0cyAtIHRvZ2dsZSB0aGUg
aW50ZXJydXB0IHJpbmcgYnVmZmVyCiAgKgpAQCAtMjU4LDYgKzEyOSwzMSBAQCBzdGF0aWMgaW50
IHZlZ2ExMF9paF90b2dnbGVfcmluZ19pbnRlcnJ1cHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCXJldHVybiAwOwogfQogCisvKioKKyAqIHZlZ2ExMF9paF90b2dnbGVfaW50ZXJydXB0
cyAtIFRvZ2dsZSBhbGwgdGhlIGF2YWlsYWJsZSBpbnRlcnJ1cHQgcmluZyBidWZmZXJzCisgKgor
ICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgorICogQGVuYWJsZTogZW5hYmxlIG9yIGRp
c2FibGUgaW50ZXJydXB0IHJpbmcgYnVmZmVycworICoKKyAqIFRvZ2dsZSBhbGwgdGhlIGF2YWls
YWJsZSBpbnRlcnJ1cHQgcmluZyBidWZmZXJzIChWRUdBMTApLgorICovCitzdGF0aWMgaW50IHZl
Z2ExMF9paF90b2dnbGVfaW50ZXJydXB0cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9v
bCBlbmFibGUpCit7CisJc3RydWN0IGFtZGdwdV9paF9yaW5nICppaFtdID0geyZhZGV2LT5pcnEu
aWgsICZhZGV2LT5pcnEuaWgxLCAmYWRldi0+aXJxLmloMn07CisJaW50IGk7CisJaW50IHI7CisK
Kwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShpaCk7IGkrKykgeworCQlpZiAoaWhbaV0tPnJp
bmdfc2l6ZSkgeworCQkJciA9IHZlZ2ExMF9paF90b2dnbGVfcmluZ19pbnRlcnJ1cHRzKGFkZXYs
IGloW2ldLCBlbmFibGUpOworCQkJaWYgKHIpCisJCQkJcmV0dXJuIHI7CisJCX0KKwl9CisKKwly
ZXR1cm4gMDsKK30KKwogc3RhdGljIHVpbnQzMl90IHZlZ2ExMF9paF9yYl9jbnRsKHN0cnVjdCBh
bWRncHVfaWhfcmluZyAqaWgsIHVpbnQzMl90IGloX3JiX2NudGwpCiB7CiAJaW50IHJiX2J1ZnN6
ID0gb3JkZXJfYmFzZV8yKGloLT5yaW5nX3NpemUgLyA0KTsKQEAgLTM2NywxMSArMjYzLDEzIEBA
IHN0YXRpYyBpbnQgdmVnYTEwX2loX2lycV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogewogCXN0cnVjdCBhbWRncHVfaWhfcmluZyAqaWg7CiAJdTMyIGloX3JiX2NudGwsIGloX2No
aWNrZW47Ci0JaW50IHJldCA9IDA7CisJaW50IHJldDsKIAl1MzIgdG1wOwogCiAJLyogZGlzYWJs
ZSBpcnFzICovCi0JdmVnYTEwX2loX2Rpc2FibGVfaW50ZXJydXB0cyhhZGV2KTsKKwlyZXQgPSB2
ZWdhMTBfaWhfdG9nZ2xlX2ludGVycnVwdHMoYWRldiwgZmFsc2UpOworCWlmIChyZXQpCisJCXJl
dHVybiByZXQ7CiAKIAlhZGV2LT5uYmlvLmZ1bmNzLT5paF9jb250cm9sKGFkZXYpOwogCkBAIC00
ODksOSArMzg3LDExIEBAIHN0YXRpYyBpbnQgdmVnYTEwX2loX2lycV9pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCXBjaV9zZXRfbWFzdGVyKGFkZXYtPnBkZXYpOwogCiAJLyogZW5h
YmxlIGludGVycnVwdHMgKi8KLQl2ZWdhMTBfaWhfZW5hYmxlX2ludGVycnVwdHMoYWRldik7CisJ
cmV0ID0gdmVnYTEwX2loX3RvZ2dsZV9pbnRlcnJ1cHRzKGFkZXYsIHRydWUpOworCWlmIChyZXQp
CisJCXJldHVybiByZXQ7CiAKLQlyZXR1cm4gcmV0OworCXJldHVybiAwOwogfQogCiAvKioKQEAg
LTUwMyw3ICs0MDMsNyBAQCBzdGF0aWMgaW50IHZlZ2ExMF9paF9pcnFfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKICAqLwogc3RhdGljIHZvaWQgdmVnYTEwX2loX2lycV9kaXNhYmxl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewotCXZlZ2ExMF9paF9kaXNhYmxlX2ludGVy
cnVwdHMoYWRldik7CisJdmVnYTEwX2loX3RvZ2dsZV9pbnRlcnJ1cHRzKGFkZXYsIGZhbHNlKTsK
IAogCS8qIFdhaXQgYW5kIGFja25vd2xlZGdlIGlycSAqLwogCW1kZWxheSgxKTsKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
