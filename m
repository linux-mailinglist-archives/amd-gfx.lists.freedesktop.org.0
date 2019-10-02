Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F66C9086
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775C6E19B;
	Wed,  2 Oct 2019 18:16:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777C66E195
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iibcEIUlMBU6AOSUcGlkJ2RDEX4HfbVlZDUjpfqcBjhwBhKw1G9nfuaHfva8oPMV2Dx6HPCk7Wg8B+U4x6Kon+LKYWD/9kz0p0IsIOdJU2AMy2nR4J5atMMSes//uiSa8EGw6ntPrM+EyKXJq3KIXmjg17Fty6vXJGZBtokC0Ecurf8uWJBS/u5Tj+N2pp5RQxBArQt7BENJ2ZI/1xWvFFqj4kxM0DUpv8VkWRIHAhDdwLpwaFt7pxG9Wa9oa8gCAvT4x4Dm7YV9BFaYkzK8V4TczQBy5IcQGbsdhbwHKyqwUE00ntuiYy6KMlWXb37+FdyTO2M59s0tC3gG/a2jVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhT8mlMnhnxz+bxoinWdpFPFzf5fVr9wtfqwvSuroxg=;
 b=FRAkhXBSYdUBoD0SJHJhMHsj1dUsUd6RmeBy1O61nYF+6nhD1z9KHhqBotZ2gJNFiO/irqyZ8dGX17juh/OBpwd2g2NpF+0u3C3DBD/uAXEDdKMofAYafSBTAC+IsL2RuR637f/Wuopp/ogY/5QWOj/dVIci1ed3/ChvAgnBmo22YtM7dOwvA8v6FXRFGscz3qO/52LVSDFg6HtmIBXskOElSAxhaxgMAXRtG8OBnBrFmP1G5vGIXqAGdfBUZ+nV+YqDoGHXojkUsBqQwCd95L2Q2rPddsyHOwKduWV1lkpMC8zp5t6Lx9t5w2JUDjSILfJypqAgtiQEk/aBDvMbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1cc::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:41 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:40 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:39 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/38] drm/amd/display: 3.2.52
Date: Wed, 2 Oct 2019 14:16:07 -0400
Message-ID: <20191002181633.22805-13-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(428003)(199004)(189003)(76176011)(51416003)(7696005)(316002)(4326008)(16586007)(26005)(2351001)(2906002)(186003)(53416004)(426003)(486006)(50466002)(11346002)(48376002)(6916009)(50226002)(8936002)(305945005)(478600001)(81156014)(8676002)(81166006)(126002)(2616005)(446003)(476003)(336012)(70586007)(70206006)(356004)(86362001)(6666004)(14444005)(4744005)(1076003)(47776003)(5660300002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3962; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b80e7e0b-c811-40d8-9160-08d74764ac60
X-MS-TrafficTypeDiagnostic: DM6PR12MB3962:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39627364B79C993AF2B60DA9F99C0@DM6PR12MB3962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7II4fIXkBizJorjmro0/9hfD5FM8+4qB2XKktLl3rSZw6ubNa/cPJ6PkcmSWcxqwHSnd4ljObaM2UouAsj4j8vzU4nq4yU+8tf4k+MMdzoUQgncbB5xfPqOckIUsL4j6qJxs9jGyJ1fzUttwaPIMFz7Vdl/O52KzfZxLIqD0D/0D4LZNpMHLa4WZUeFDvYrvaNpaXT72p0UafIp2TLsNKvQTiG5gLABGiiKXso1XzxjuqmzJlKnrNQeZgTidY7QyFJ1vqWzV/QoCmj9tPxkQI5lP48ns715umnXBlFUmIoY2Q8uh4fRv6mfQ8dNL6mCj53YjecszGFqTGHoxsVvU/kpyqxqerrXUG1+EaiEjDgzDendoaZb0FXRlu6lvV415pA0p5pa+FQdI5GXkVts//BrI/ysFHnDZAypjxkkBPH4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:40.9565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b80e7e0b-c811-40d8-9160-08d74764ac60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3962
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhT8mlMnhnxz+bxoinWdpFPFzf5fVr9wtfqwvSuroxg=;
 b=APeTBrdGUd7MX+EzHdnartTNq+lf2Z+jlZk1SoVXkR2lIjtvVmrkGJ0hZuMKYPuh8+iOChDWgb8WjsaoEVdnSAa94qywoFKJpLFMv8PGNSsAbKbSPcl6by7EPPTQNZnvHsc5zxmfLeVETqNZ71P2oYqDcBvU4HnT1U6TZ8xnlQg=
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
Cc: Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CgpDaGFuZ2UtSWQ6IEk5OGYy
N2Y4NmY2ODNlZDcxNDI0MTQ5NmY4MjI1NGNiMzkwMjNkOGM3ClNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgS29vIDxBbnRob255Lktvb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBLb28gPEFu
dGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJl
ZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMu
aCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggMDkyMWY5MTAxMDI1Li4zZGZjNTcw
NGJiNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0zOSw3ICszOSw3IEBA
CiAjaW5jbHVkZSAiaW5jL2h3L2RtY3UuaCIKICNpbmNsdWRlICJkbWwvZGlzcGxheV9tb2RlX2xp
Yi5oIgogCi0jZGVmaW5lIERDX1ZFUiAiMy4yLjUxLjEiCisjZGVmaW5lIERDX1ZFUiAiMy4yLjUy
IgogCiAjZGVmaW5lIE1BWF9TVVJGQUNFUyAzCiAjZGVmaW5lIE1BWF9QTEFORVMgNgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
