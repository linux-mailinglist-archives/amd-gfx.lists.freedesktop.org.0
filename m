Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A4A0C19
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCE689F49;
	Wed, 28 Aug 2019 21:04:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820059.outbound.protection.outlook.com [40.107.82.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8490C89F07
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn/MOq+/LMXxcroXhKI3r+zLSktd1s9S+TlMux0pVyPtKAoISpBGdhDe8jJLzy1oXvEPgBzFVXwy5ZWeAvMnO5cSNc7fNbdogJzkwfxXdifccisM8VsIuTS5/QQMjcftSVVz2N7medyHzDEEJHDJZM76xoes7zdscztZYrnF5x9ioj3oHquBdEPn1iWzO1dy+XT2m8JVgODtpro/tn4AFX7k9B8/JbtINeGL/GN0l/jXqB7O48av7n2XJ7bG9HVBPzJs4tGjiSFSVdkFNT6W/04ZQo6JDgHTE7mpL0K9bcgRaib9Z8a6SMFECllNyqXR1ojwSFJqoXFt+wy03QI/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkjtpMgCNa+YS4PA9oIJnhSpAUoON25V3tPA/w1dLI4=;
 b=UMJ8jozjuVTMLbv0kpUGDHnMJT9GVyiWVURaOwFqEyNKhVpO929b2LYkdyZPgThB9Mf7nLcSuTTtK9PCM8KTBo6jfOsj2NhVDF/ZCgqQ7pB3Q0doGNbr86hSsTF/GN13KuoGvwS1Er+xw0+JvPfiod9w/+BHI/2bWcTNu/S2oBtUeDg9OfNJL4ImItDANZJShPmBuTUpMNsxCV0oSzJ+H91wOM59Kmbi2/U/DUtotcg6MBZlNqQHG4tyF/0T1Yi5yCvN3AIlqkXaALp5LFuy2WBmac+xLNzUqOzsSBFhhB2uL0yRt3aoOFf8M16pBZzEefjI3dOJERu8beHDeLwhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (2603:10b6:0:56::19) by
 BN6PR12MB1523.namprd12.prod.outlook.com (2603:10b6:405:10::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 21:04:19 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:18 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:07 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/17] drm/amd/display: verify stream link before link test
Date: Wed, 28 Aug 2019 17:03:53 -0400
Message-ID: <20190828210354.21464-17-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
References: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(486006)(476003)(86362001)(4326008)(446003)(50226002)(26005)(2616005)(126002)(11346002)(53936002)(53416004)(8676002)(186003)(6916009)(81156014)(316002)(2351001)(51416003)(8936002)(7696005)(76176011)(16586007)(336012)(1076003)(356004)(6666004)(5660300002)(14444005)(50466002)(70206006)(15650500001)(426003)(2906002)(478600001)(48376002)(81166006)(305945005)(70586007)(36756003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1523; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2458641-2540-4a1c-b284-08d72bfb4b01
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1523; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1523:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1523B0385FF62C2FAA74ACEAF9A30@BN6PR12MB1523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tLuFAMhajWkvSvSLZPn/eR3D89N5QJGnoe5g+KPnjKIuCQE0DGcMQELN5qRfcLhwlxSTbPoKCRIlOrFzWq0GmfkWwjWnKNPJQyHXXnffy3A9d8cTvezQR5vOXdozdl0FjBaUtxc8DcOR7Pk3rWPwwqAdnj5ITKW7Exq04/cncj+UU71a1P2FHSRg/Ub8rHHf2Rbx466sA59hf264vV8AhRY+cafVYzjzeFjit69eSC171aSuTzC1JSAKeV/DcYIVf7CPof6BrCLiJj8H1Z6lPDpunIdnwx735TRHoP3dduuHr4jOrqUENBm9HQvu/8XE8ApgQKTgsJ3r2SiT1i3ntYy78naC441x32H6oeOXE8X2rjI+XJhtVYNKk4C3BQ5G5e44jnAX+VjCl9T2cOwAAaN4wkZBx0HmBIuHt3HAtfU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:18.9831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2458641-2540-4a1c-b284-08d72bfb4b01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1523
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkjtpMgCNa+YS4PA9oIJnhSpAUoON25V3tPA/w1dLI4=;
 b=MHf0tLHo7ifd7nBrdRL73Thceeen3i2zYnvJmyK9ibeSm4INeraoeFbzq3pVlboLnbMkh7VwQWIw7iSSW5XakWr8QPT5YwlgdjGt9ubZ+kjSmC7aWjpe8W0QHgilIwnysQ49YXBPyQsK6BC2MRLi6vmmjiZMI74NLjn2hWxNHAo=
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
Cc: Jing Zhou <Jing.Zhou@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmluZyBaaG91IDxKaW5nLlpob3VAYW1kLmNvbT4KCltXaHldCkRQMS4yIExMIENUUyB0
ZXN0IGZhaWx1cmUuCgpbSG93XQpUaGUgZmFpbHVyZSBpcyBjYXVzZWQgYnkgbm90IHZlcmlmeSBz
dHJlYW0gbGluayBpcyBlcXVhbAp0byBsaW5rLCBvbmx5IGNoZWNrIHN0cmVhbSBhbmQgbGluayBp
cyBub3QgbnVsbC4KClNpZ25lZC1vZmYtYnk6IEppbmcgWmhvdSA8SmluZy5aaG91QGFtZC5jb20+
ClJldmlld2VkLWJ5OiBXZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6
IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfaHdzcy5jCmluZGV4IDc5
NDM4YzRmMWUyMC4uYTUxOWRiYzVlY2I2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYwpAQCAtMjc3LDcgKzI3Nyw4IEBAIHZvaWQg
ZHBfcmV0cmFpbl9saW5rX2RwX3Rlc3Qoc3RydWN0IGRjX2xpbmsgKmxpbmssCiAJCWlmIChwaXBl
c1tpXS5zdHJlYW0gIT0gTlVMTCAmJgogCQkJIXBpcGVzW2ldLnRvcF9waXBlICYmICFwaXBlc1tp
XS5wcmV2X29kbV9waXBlICYmCiAJCQlwaXBlc1tpXS5zdHJlYW0tPmxpbmsgIT0gTlVMTCAmJgot
CQkJcGlwZXNbaV0uc3RyZWFtX3Jlcy5zdHJlYW1fZW5jICE9IE5VTEwpIHsKKwkJCXBpcGVzW2ld
LnN0cmVhbV9yZXMuc3RyZWFtX2VuYyAhPSBOVUxMICYmCisJCQlwaXBlc1tpXS5zdHJlYW0tPmxp
bmsgPT0gbGluaykgewogCQkJdWRlbGF5KDEwMCk7CiAKIAkJCXBpcGVzW2ldLnN0cmVhbV9yZXMu
c3RyZWFtX2VuYy0+ZnVuY3MtPmRwX2JsYW5rKAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
