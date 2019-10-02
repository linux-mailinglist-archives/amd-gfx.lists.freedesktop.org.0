Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A29C9090
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4FD6E96F;
	Wed,  2 Oct 2019 18:16:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710057.outbound.protection.outlook.com [40.107.71.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7903A6E1AA
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmjxhrojJd4d3Gg6307LoYmGxQrxQPEVzizgyJ8Ro/YxT4cpSIARtW+oEfyXo5USUsr9dheT1H41ZpoEKWQjx0WPxWDvRU1OI+asCUpayX2Yu6Z20wWptPyrWUnYUY6sXC05zA0LuXDVH/6Ba/4yp+4tkmlGGkRTVcDhtRL6JkaRJnTI0Bc4Hc/OTdJ6BkpCLwl6Da0aOObN4SlXgAeAWPbAqcq0c2bzPJkjMrDKQCOBp9CNrAcz04F+C7tuG3gNmCE1qBak+cIwTshywH2BJjCUyQHrZl5QFfyRkAz4qf7Czv+FJQqhQehE4tjeJiUskzhMdwcuuEoNtqSMfqtLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/pEN+oXYGcRjGDYLpCNSjRsUkV9Bv8Jp6WWxSJ08DU=;
 b=NMHH+xf3zWmy4PedfD7aQip/xAQzDRL9HoFs2S/NTNBXIBhun3NQ9pX8nNv5aH/EvTIVvUITjbOh7tzbVu35NCPeNrRSwG//GRrtrL/Scb3qjOCJdyzEopAZ6gpItheNKtLvLJldSnL/3A/dZoBFcY8fUJlELQftK1u7eKDPhaA7KNIVJjV6e4FzKkv1EIAECL8hxONWo2jJjPLuQfqXyrmSThmxVj1fcLEgYJI17mN/tp4Qve9hhNhVXIb59JgFI2Wbj0NBflzfHYKW/WbEyUhoL/jJsT4jh7nSslqnWZW+rGUWjFdQHiG4yABVB9G8z2ICogn/Fd3lEZJmm+jVzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0023.namprd12.prod.outlook.com (2603:10b6:4:1::33) by
 MWHPR12MB1742.namprd12.prod.outlook.com (2603:10b6:300:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:43 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0023.outlook.office365.com
 (2603:10b6:4:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:43 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:41 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/38] drm/amd/display: wait for set pipe mcp command
 completion
Date: Wed, 2 Oct 2019 14:16:13 -0400
Message-ID: <20191002181633.22805-19-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(428003)(189003)(199004)(14444005)(47776003)(6666004)(356004)(50466002)(2906002)(4326008)(5660300002)(8676002)(478600001)(305945005)(70586007)(70206006)(7696005)(51416003)(426003)(76176011)(6916009)(8936002)(81166006)(50226002)(186003)(86362001)(81156014)(11346002)(486006)(16586007)(446003)(476003)(1076003)(126002)(2616005)(36756003)(48376002)(2351001)(53416004)(26005)(336012)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1742; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77233876-ae6f-4a3a-c7fe-08d74764adbe
X-MS-TrafficTypeDiagnostic: MWHPR12MB1742:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1742AF73FF097E85B921F2E4F99C0@MWHPR12MB1742.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/WdzvsVv9N2+SeqAObyyHoVIWv/5sQvRIqeKWnsG5DihpivmJAn4Q3E25RYe0mKu7FGYp4yOO7lmqSPdgQ15S8m/Bwyxmr0GeNgDuY6fgHTMK/fOr+JzFYGq97XNl8o+9tcWPCXhjUlcMees9Fy+slbZmLeUv+RfIe4okLIkNAGPVntMA+NZ16TAs408J+B1xUIhpdrDJDiQLwZwZ5Aa8SqSgy1LJKjLdhipWYBelwQXqMxXfr70XJopy0Ads5KQMlrwt03JuomWEEWXFxfTOsg66GRGsuAPzgHRRKmF5NWkuLvplvim1jPkoiaZbFnYuRaGwrRSWJKk3Oj2nP1eam8NpJw8mWqz/ZZsfWwg1Uwbr3FbVGRD4CuRRNYG7T/4kSU8gykAmxZeWiDF4FtdawDULssvOGsAI9i730D5zE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:43.2220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77233876-ae6f-4a3a-c7fe-08d74764adbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1742
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/pEN+oXYGcRjGDYLpCNSjRsUkV9Bv8Jp6WWxSJ08DU=;
 b=wiay2iBZy/Vk0blv5/FtWfyyANIBKhMOECkdhIBA3jxnUNsG20AE6TlZp/IMLSxREGk4DIf3MXry9ImUd3WxQf98nB3qjVqCmj1JmYGHK1fQv+QBWipfelU56VUxF7y4vaOtb0Kk+MnFrrY1bjAGvXw5IbV+fakr25ry3LiU9HM=
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
Cc: Josip Pavic <Josip.Pavic@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaXAgUGF2aWMgPEpvc2lwLlBhdmljQGFtZC5jb20+CgpbV2h5XQpXaGVuIHRoZSBk
cml2ZXIgc2VuZHMgYSBwaXBlIHNldCBjb21tYW5kIHRvIHRoZSBETUNVIEZXLCBpdCBkb2VzIG5v
dCB3YWl0CmZvciB0aGUgY29tbWFuZCB0byBjb21wbGV0ZS4gVGhpcyBjYW4gbGVhZCB0byB1bnBy
ZWRpY3RhYmxlIGJlaGF2aW9yIGlmLApmb3IgZXhhbXBsZSwgdGhlIGRyaXZlciB3ZXJlIHRvIHJl
cXVlc3QgYSBwaXBlIGRpc2FibGUgdG8gdGhlIEZXIHZpYSBNQ1AsCnRoZW4gcG93ZXIgZG93biBz
b21lIGhhcmR3YXJlIGJlZm9yZSB0aGUgZmlybXdhcmUgaGFzIGNvbXBsZXRlZCBwcm9jZXNzaW5n
CnRoZSBjb21tYW5kLgoKW0hvd10KV2FpdCBmb3IgdGhlIERNQ1UgRlcgdG8gZmluaXNoIHByb2Nl
c3Npbmcgc2V0IHBpcGUgY29tbWFuZHMKCkNoYW5nZS1JZDogSTg1ZDRiZGJiMmNkZGJmNzVjZTk3
MjFhODAyZGQ2YzM3YjZmN2ZhMDcKU2lnbmVkLW9mZi1ieTogSm9zaXAgUGF2aWMgPEpvc2lwLlBh
dmljQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNv
bT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jCmluZGV4IDllZGQzNjljMTIyMC4uZDc1OWZkY2E3
ZmRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9h
Ym0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYwpA
QCAtNzcsNiArNzcsOSBAQCBzdGF0aWMgYm9vbCBkY2VfYWJtX3NldF9waXBlKHN0cnVjdCBhYm0g
KmFibSwgdWludDMyX3QgY29udHJvbGxlcl9pZCkKIAkvKiBub3RpZnlETUNVTXNnICovCiAJUkVH
X1VQREFURShNQVNURVJfQ09NTV9DTlRMX1JFRywgTUFTVEVSX0NPTU1fSU5URVJSVVBULCAxKTsK
IAorCVJFR19XQUlUKE1BU1RFUl9DT01NX0NOVExfUkVHLCBNQVNURVJfQ09NTV9JTlRFUlJVUFQs
IDAsCisJCQkxLCA4MDAwMCk7CisKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
