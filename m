Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF8C909E
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DD16E982;
	Wed,  2 Oct 2019 18:17:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780084.outbound.protection.outlook.com [40.107.78.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA146E980
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhyHjnkkrC07I1pA/+JwSdjQVRbWwLGC77HL3F2k2fO41mDk/C3LxUOO0mbEVUZreL6UEyiv46zFMclQBg8FUTzpYmbeLfTCDQDsLXvt7+ZBNt+Q3jnaVKk0BpsgtojgqzUQJ5JUbQeGcC2s/yapsGvIdeY1pWopHNP/EJsDBnaC0+3VfkiqLiZxQXLSUr5obnmO/dQLMTvMR2BwF6HVOaWZ7Yp71aHsy7BOVGKVFxecIUaiEvCxHqlVNSQi1miTdT7uzfS+vYUGTce3V4MGVYyiSDEoPK8aJ5kw7QxBR8rp8Af/42InnLXlpmpIFP7cC07SLFcH9FsbxWBg7Arv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrO/WwNyBaiX1oHVeLhAzP2r/Cj52FSgTfJOK3Qa+0Q=;
 b=UZhLd97tsKFVii3YCSs4pYSqgFWxFoYJXp0aPHcGgX+8q2EqoEMB5pC6kgv+Kq3tPP7WrIkbabfS5BeJrxM6MwSZEMsSuOPD/xD5zr5FEnJ0JFCLata7q/esWrQI+9wdVQ/gSj+10vzwZ/d5bJUz1TKNH5uaa36EjoyD8HQUib8XC2ZeYRIbSfAR1dhd/z/cGhPEyt/XvEMzbvJ48P5OC9bXioNHtS+fFAIo7sKMx9aiF7DvrT2wCf6hL37DjyUD0lk/VA90Pt2dF5a3rWuLxxMo5TEIFgg6mM4EUUoXxKIBJ4714rWQQfzVRBK9/r1IzcisttG4xQ90byM7voBLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 BN8PR12MB2849.namprd12.prod.outlook.com (2603:10b6:408:6e::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:56 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:55 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:54 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 36/38] drm/amd/display: Skip DIG Check if Link is Virtual for
 Display Count
Date: Wed, 2 Oct 2019 14:16:31 -0400
Message-ID: <20191002181633.22805-37-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(346002)(376002)(39860400002)(428003)(189003)(199004)(51416003)(7696005)(26005)(2351001)(316002)(8936002)(86362001)(50226002)(76176011)(4326008)(47776003)(16586007)(2906002)(48376002)(70206006)(8676002)(50466002)(305945005)(53416004)(81156014)(336012)(81166006)(126002)(2616005)(11346002)(486006)(1076003)(426003)(70586007)(446003)(6666004)(356004)(186003)(14444005)(478600001)(36756003)(5660300002)(6916009)(476003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2849; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c2ddb61-87b4-45d2-45c8-08d74764b517
X-MS-TrafficTypeDiagnostic: BN8PR12MB2849:
X-Microsoft-Antispam-PRVS: <BN8PR12MB28495B6F754900D4C42C6CBCF99C0@BN8PR12MB2849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JT+43dzBNT6ENOUQPYYJTDfFhOZn0JG7s9TxA21NHSHu0+BvxHkB/2SnY7pOaksdM18+OvjShv6xPvaPmPzay2mMsVXagFlTRzev7gm/cIkn70Odm6qvOj1tpT+/yY/QzMEMGNhMBlmG0QihVF774vWljYjPiQfreuuK47ywq/g9g82eKfKynToFlPxqweJnWgYnDHYoiCigRIMxWLaRATh6u38zWwBi+KJpgb3+1oez/jJppI8PfR21o0yu5ClwzseHTEtMAr40FiayZS7mNm9cAyfzh9jG5iK3owzQrzmNUmee6mfMpTh8+grVoulPD+npZQk7IHQ79b4NUOSjQKEaMkqhJ/o84gtgCV1ZOUEdvcpxRuenISSgj5QVS/dcNvKclJw5poRwOkAkA8tnoURkv9Jqn4wLHqd3QWjdtfc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:55.5346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2ddb61-87b4-45d2-45c8-08d74764b517
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrO/WwNyBaiX1oHVeLhAzP2r/Cj52FSgTfJOK3Qa+0Q=;
 b=EcUsXHCWpqv7JI7Lq0g9HU9yCayWbgpKM9uO2hHTbn3jySnspP4M+wpEz+8z9L/FV4LcDRgcicCMWYtJMUwu8UlZ26fIJJgp/FcNHPMhZuGzidV4L/Tv6PiTU7V8xiPPZpzXZVUE0d3gBjYtjixjOGdlIch1E6LDGho78+aTIbM=
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
Cc: Sung Lee <sung.lee@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3VuZyBMZWUgPHN1bmcubGVlQGFtZC5jb20+CgpbV0hZXQpXaXRob3V0IGEgY2hlY2sg
Zm9yIHZpcnR1YWwgbGlua3MsIGV2ZXJ5IGxpbmsncyBESUcgd2FzIGdldHRpbmcKY2hlY2tlZCBm
b3IgZW5hYmxlZCBvciBkaXNhYmxlZC4gSWYgbGluayB3YXMgdmlydHVhbCwgc2luY2UgaXQKZGlk
IG5vdCBoYXZlIGEgRElHLCB0aGlzIHdvdWxkIGNhdXNlIGlzc3Vlcy4KCltIT1ddClNraXAgRElH
IEVuYWJsZSBjaGVjayBpZiBsaW5rIGlzIHZpcnR1YWwgYW5kIGFkZCB2aXJ0dWFsIGxpbmsgdG8K
dG8gZGlzcGxheSBjb3VudC4KCkNoYW5nZS1JZDogSWNjYmM2NDMzNTYyODI0N2U5MjgxNGJkZWJj
ZDhjNzg0MzllNDgxNGMKU2lnbmVkLW9mZi1ieTogU3VuZyBMZWUgPHN1bmcubGVlQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBZb25ncWlhbmcgU3VuIDx5b25ncWlhbmcuc3VuQGFtZC5jb20+CkFja2Vk
LWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyLmMg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIx
L3JuX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Rj
bjIxL3JuX2Nsa19tZ3IuYwppbmRleCA2OGQzODIzOTMwNGMuLmNhZTZhNmY1NDA1ZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xr
X21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIx
L3JuX2Nsa19tZ3IuYwpAQCAtNzksNyArNzksOCBAQCBpbnQgcm5fZ2V0X2FjdGl2ZV9kaXNwbGF5
X2NudF93YSgKIAkJICogUzBpMi4KIAkJICovCiAJCS8qIGFidXNpbmcgdGhlIGZhY3QgdGhhdCB0
aGUgZGlnIGFuZCBwaHkgYXJlIGNvdXBsZWQgdG8gc2VlIGlmIHRoZSBwaHkgaXMgZW5hYmxlZCAq
LwotCQlpZiAobGluay0+bGlua19lbmMtPmZ1bmNzLT5pc19kaWdfZW5hYmxlZChsaW5rLT5saW5r
X2VuYykpCisJCWlmIChsaW5rLT5jb25uZWN0b3Jfc2lnbmFsID09IFNJR05BTF9UWVBFX1ZJUlRV
QUwgfHwKKwkJCQlsaW5rLT5saW5rX2VuYy0+ZnVuY3MtPmlzX2RpZ19lbmFibGVkKGxpbmstPmxp
bmtfZW5jKSkKIAkJCWRpc3BsYXlfY291bnQrKzsKIAl9CiAKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
