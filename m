Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C8881039
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 04:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257A889CD4;
	Mon,  5 Aug 2019 02:14:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730059.outbound.protection.outlook.com [40.107.73.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAF089CD4
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 02:14:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ribq40T6MhD5P7E/g4WB3YiczHnl9XhfckctNWRS8yIrVT8/yxQAw6926ccWd3fwGG1dc0PeQgd149FAe4U5PFOKsjvwX9+vlhIovy97DA25Fc520+PgeX7FlAtxHslp0dBFvMpEQmgp2ZjuCq/OqoPOjIj/Tni+PpRnDTyD3JwNxymAuew0cp6LKphOO36PXkZPZbPqScIGh2dfcIvDGZboQmX31LJf7kG7dcjT6+3d0j9SesW5amB1kbMUCr4zeu90EtJ2kmr8+YiqElFncdPemndHN24MsL7APs+RIxP3xymdtCyfZUWuAsFC5aB5E4kJAQvXlJIM0dugavTaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToB8gLSuaBu0JtnTX0wz5qfILdNBd4WccMbC8G70o6Y=;
 b=EAa3cxzJuBwjLKlqFOJL5Es02P65LpB3UIWQgofpmya7WsnvJRw8digSwtlW7AXb5pdEx2r1svTTdr5HNMmc4NoYcAm0pRgfOrB5CueHTGE+WJsur+vuWNGFYacJ8QCDbfu5q+bnBowQQR9uOEemKKytTNWfKvGrzqKdUqERgporVXIRcduLqACasxM/WnVnpaHJZsNCHBTJDuYZOX4wAUGOX92bnovpi6a+uatajd4su5EcQJqCXpOz9/d87RIW5Nt8k4kSJHfFNZjTqSmK/chBiVj2XbyS0+Ym85PwEXFlR+ZyvDwkOuPQ9zWf9HIBwANqRGBuoE6qK9AmWWdd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0070.namprd12.prod.outlook.com (2603:10b6:0:57::14) by
 CY4PR12MB1608.namprd12.prod.outlook.com (2603:10b6:910:d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 02:14:11 +0000
Received: from DM3NAM03FT065.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM3PR12CA0070.outlook.office365.com
 (2603:10b6:0:57::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Mon, 5 Aug 2019 02:14:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT065.mail.protection.outlook.com (10.152.82.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Mon, 5 Aug 2019 02:14:10 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Sun, 4 Aug 2019
 21:14:10 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 1/1] tests/amdgpu: add the missing deactivation case
 for dispatch test
Date: Mon, 5 Aug 2019 10:13:53 +0800
Message-ID: <1564971233-22109-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(2980300002)(428003)(189003)(199004)(186003)(81166006)(81156014)(8676002)(48376002)(305945005)(50466002)(6916009)(5660300002)(4326008)(68736007)(2351001)(478600001)(70586007)(70206006)(47776003)(8936002)(51416003)(50226002)(2906002)(53936002)(16586007)(316002)(356004)(6666004)(26005)(49486002)(336012)(36756003)(86362001)(426003)(476003)(126002)(2616005)(486006)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1608; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ec825ac-2ea6-44b8-955f-08d7194a9aac
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1608; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1608:
X-Microsoft-Antispam-PRVS: <CY4PR12MB160884A82C930761B3AB2F3BF6DA0@CY4PR12MB1608.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-Forefront-PRVS: 01208B1E18
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rHO5nDbNNWsDJaFAYirp9SCV+ZOPCxtVHVr8SuiIUMu7/pFEwOdc7hmQlcST/yzaHaQPNgMQp536TQrPP0tHXGNpJPpUmercsTH1WwQvOy/oW+p7PGcleTF6mbjQv6O+Q2vYJ7W69AMaEl0sxxhIku3pK7dGwlx1s9Y09h60sRIVMfe13wuLq0MJuNCxgY/yYi3643f9hwDABg9efgGcqA3e1j2TixJNQfuHldZETHaPT4BS0JEOfCk3gFPsuSanJw3ECUVlb5ZeCLE46ftXMit09BTdi5NTPEf6Df0JllIw4MNHp/qqXW11m633wfjIe6Fi8WLdLfmUeditm/fyRdDAsp6POzdE150R6fw+zsE7e6tsc/caWciouI/jQD+dxqetvCW9h89e4xkFMocVI3t50y79RJHUfAJGIlRtGb8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 02:14:10.8139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec825ac-2ea6-44b8-955f-08d7194a9aac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1608
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToB8gLSuaBu0JtnTX0wz5qfILdNBd4WccMbC8G70o6Y=;
 b=uwv0J3J0oitDbggg2pBQO9ivknFWXsnpCZfQ3bbXwTqTOWWrM4pq90xMC0L2q/Ox7eTLrmeVVwgQzoLtUbwmbxATAov1MZrNWTcvmD9j+L53T7J0bZB5RvMwn38nSJWg/LiA9Uxm5b9Mo2JBrvnl6ft1WikAHdhcrpajVONGRWg=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJNTAyY2M1ZmRlN2YwMGU0MWQ0OTZiZmJhMDk2M2Q0ZGIyMDQ1OWUwMApTaWdu
ZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KLS0tCiB0ZXN0cy9hbWRncHUvYW1kZ3B1
X3Rlc3QuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3QuYyBiL3Rl
c3RzL2FtZGdwdS9hbWRncHVfdGVzdC5jCmluZGV4IGE0Y2U4Y2UuLmRjNTQxNTUgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2FtZGdwdS9hbWRncHVfdGVzdC5jCisrKyBiL3Rlc3RzL2FtZGdwdS9hbWRncHVf
dGVzdC5jCkBAIC00NzIsOSArNDcyLDEyIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kaXNhYmxlX3N1
aXRlcygpCiAJCQlmcHJpbnRmKHN0ZGVyciwgInRlc3QgZGVhY3RpdmF0aW9uIGZhaWxlZCAtICVz
XG4iLCBDVV9nZXRfZXJyb3JfbXNnKCkpOwogCiAJLyogVGhpcyB0ZXN0IHdhcyByYW4gb24gR0ZY
OSBvbmx5ICovCi0JaWYgKGZhbWlseV9pZCA8IEFNREdQVV9GQU1JTFlfQUkgfHwgZmFtaWx5X2lk
ID4gQU1ER1BVX0ZBTUlMWV9SVikKLQkJaWYgKGFtZGdwdV9zZXRfdGVzdF9hY3RpdmUoQkFTSUNf
VEVTVFNfU1RSLCAiRGlzcGF0Y2ggVGVzdCIsIENVX0ZBTFNFKSkKKwlpZiAoZmFtaWx5X2lkIDwg
QU1ER1BVX0ZBTUlMWV9BSSB8fCBmYW1pbHlfaWQgPiBBTURHUFVfRkFNSUxZX1JWKSB7CisJCWlm
IChhbWRncHVfc2V0X3Rlc3RfYWN0aXZlKEJBU0lDX1RFU1RTX1NUUiwgIkRpc3BhdGNoIFRlc3Qg
KEdGWCkiLCBDVV9GQUxTRSkpCisJCQlmcHJpbnRmKHN0ZGVyciwgInRlc3QgZGVhY3RpdmF0aW9u
IGZhaWxlZCAtICVzXG4iLCBDVV9nZXRfZXJyb3JfbXNnKCkpOworCQlpZiAoYW1kZ3B1X3NldF90
ZXN0X2FjdGl2ZShCQVNJQ19URVNUU19TVFIsICJEaXNwYXRjaCBUZXN0IChDb21wdXRlKSIsIENV
X0ZBTFNFKSkKIAkJCWZwcmludGYoc3RkZXJyLCAidGVzdCBkZWFjdGl2YXRpb24gZmFpbGVkIC0g
JXNcbiIsIENVX2dldF9lcnJvcl9tc2coKSk7CisJfQogCiAJLyogVGhpcyB0ZXN0IHdhcyByYW4g
b24gR0ZYOSBvbmx5ICovCiAJaWYgKGZhbWlseV9pZCA8IEFNREdQVV9GQU1JTFlfQUkgfHwgZmFt
aWx5X2lkID4gQU1ER1BVX0ZBTUlMWV9SVikKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
