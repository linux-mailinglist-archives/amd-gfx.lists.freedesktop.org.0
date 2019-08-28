Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8053AA0BFC
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 23:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A7E89F01;
	Wed, 28 Aug 2019 21:04:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730071.outbound.protection.outlook.com [40.107.73.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9D789F01
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 21:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYUf4hupEHYDzH4joq8O2hC6+LdRwPt1VsLWSzIB3PNpXOyvWTWKdmGzSUqStzHWiWWL2D/7AN7iyqu8CM6AM66+AK7KzhwCjKHyquuDHjCnOVBnJSJFN1AD4YcQt1dFtXq1GB8ubtN9jN3N8JSJ+iQOSdTX6SkVJJ8T66UzFXlyMSuJVQGZlsDHwskRITk+UTbiEnChacjnog8J3tiF5AePokjlMvyWzC+DXb2BVDD/Zn7A58CoxCylbEEn1HNfNYYQBmmi5PPVtI9eOSHpfBgA9Q/b72k4Iv4iZk9e2BlhIu+fjBQQqt0zJGnhmaFTDCOgawj8xxU6gtbdezyAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uMjRAGPNeOKuePwAaj9lzAzp3kqAjtTaoxtJvH0gSk=;
 b=d+otOJOAU/oAse0D0j2No0ehy8mjzjcDCxvBcIq0xmZ2POM4g3twWeqnIJSe+yhwGMS8L3iPR8mEXvtR/RluMunpiaXoCcM8w8MOMiYpiRV8IsvH0nYe3iqpc0e2d21mxd+CvQFEhXWdGkMA9JMwkf0ajshF5bOaUMxN0QsgYXr9l2QQUsCmfWmhFDvqq7ubYGhvGmlEdMN5F24t/ygBaPlmYEILJAJ5g8KlCvtHi9aZMnjTHxvwo1ifbGlXSYkcyqrI8ZVNUKV4yGRKM37sPei+AVuG5LWB8TNPLgShW5sJVaBQ/1/XbDQ4Bgvm1cYYHdS7T7E1O0tnx2v2/Lgq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0052.namprd12.prod.outlook.com (2603:10b6:0:56::20) by
 DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 28 Aug 2019 21:04:03 +0000
Received: from BY2NAM03FT004.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by DM3PR12CA0052.outlook.office365.com
 (2603:10b6:0:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 28 Aug 2019 21:04:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT004.mail.protection.outlook.com (10.152.84.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Wed, 28 Aug 2019 21:04:02 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 28 Aug 2019
 16:04:01 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/17] DC Patches 28 Aug 2019
Date: Wed, 28 Aug 2019 17:03:37 -0400
Message-ID: <20190828210354.21464-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(428003)(189003)(199004)(14444005)(4326008)(53936002)(186003)(426003)(6666004)(478600001)(356004)(476003)(126002)(2351001)(2616005)(81156014)(8676002)(81166006)(336012)(16586007)(6916009)(48376002)(50466002)(50226002)(86362001)(8936002)(51416003)(36756003)(2906002)(1076003)(70586007)(70206006)(26005)(7696005)(486006)(47776003)(305945005)(316002)(5660300002)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a59c43a-5488-4235-24f0-08d72bfb40f2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12757E39B7F09C89A4384866F9A30@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 014304E855
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RZaq3x/r7o5euMP6ORA0T++N9MjizMsYoeYohZ+JB/ju8ZDTEDPShswR8vniFdRQkbXxUfzOerAdSkSFiICz/3TMWggm3oO/4oDiwu8Mz5wxg0COsTlH7mixM6yY3eyzHXa/T6/wPBe9X8QqYynyUBsGuwi93PVHAwxyBoAp6D9V0nuTzNNLLzob+Xrb9nwtstrBYBQqiyO4s6Gos+vAOzUjjjRTmM2KQrQzBg9C2VKErsX/vGqCLcDSYhD5j9OLUpXb/vm9iXe1rW9a5qDHcXS4iKdz7MfUVFP8jpkyTxtN9ApdN18Oxz0Rm2z5vJb2Z1yV/xl9c0GlfD5r4eXlFBOe/bXuwoOqXDnuWjF3TTHDJx8PcJw4gjfTG4nQmARhdbNs9RyH0yczEioB1zpbpN3ybzG4cZyFZ81nADckIFU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2019 21:04:02.1109 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a59c43a-5488-4235-24f0-08d72bfb40f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uMjRAGPNeOKuePwAaj9lzAzp3kqAjtTaoxtJvH0gSk=;
 b=4DNJ5FhS4ovXx4BPBpDVtL2qr6TwsVAWHUIBYiax5+Zd65G/pzOrbZi38CrzN6P/0GIza8iZkdLq3vkddUO0RLGPY3NqOlbgH2z110Zp/5ZYQFopcG7YyZ0fu0qtz+4DPg6XyRWPCfP5eIV9x/XWUthk/Fo+f6+ajcRiaGDuWuc=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3VtbWFyeSBPZiBDaGFuZ2VzCiphZGQgc3VyZmFjZSByZWdpc3RlcnMKKnVuZGVyZmxvdyBmaXhl
cwoqaTJjL2F1eCByZWZhY3RvcnMKKkRTQyBmaXhlcwoKQWx2aW4gTGVlICgxKToKICBkcm0vYW1k
L2Rpc3BsYXk6IERvbid0IGFsbG9jYXRlIHBheWxvYWRzIGlmIGxpbmsgbG9zdAoKQW50aG9ueSBL
b28gKDEpOgogIGRybS9hbWQvZGlzcGxheTogMy4yLjQ5CgpCYXlhbiBaYWJpaGl5YW4gKDEpOgog
IGRybS9hbWQvZGlzcGxheTogSXNvbGF0ZSBEU0MgbW9kdWxlIGZyb20gZHJpdmVyIGRlcGVuZGVu
Y2llcwoKQ2hhcmxlbmUgTGl1ICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IGRjZTExLnggL2RjZTEy
IHVwZGF0ZSBmb3JtdWxhIGlucHV0CgpEbXl0cm8gTGFrdHl1c2hraW4gKDIpOgogIGRybS9hbWQv
ZGlzcGxheTogdXBkYXRlIG5hdmkgdG8gdXNlIG5ldyBzdXJmYWNlIHByb2dyYW1taW5nIGJlaGF2
aW91cgogIGRybS9hbWQvZGlzcGxheTogcmVtb3ZlIHRlbXBvcmFyeSB0cmFuc2l0aW9uIGNvZGUK
CklseWEgQmFrb3VsaW4gKDIpOgogIGRybS9hbWQvZGlzcGxheTogRml4IERNTCB0ZXN0cwogIGRy
bS9hbWQvZGlzcGxheTogQWRkIG1pc3Npbmcgc3VyZmFjZSBhZGRyZXNzIHJlZ2lzdGVycwoKSmFl
aHl1biBDaHVuZyAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBPVEMgdW5kZXJmbG93IGZpeAoKSmlu
ZyBaaG91ICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IHZlcmlmeSBzdHJlYW0gbGluayBiZWZvcmUg
bGluayB0ZXN0CgpKdW4gTGVpICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IHJlbW92ZSBodyBhY2Nl
c3MgZnJvbSBkY19kZXN0cm95CgpLcnVub3NsYXYgS292YWMgKDEpOgogIGRybS9hbWQvZGlzcGxh
eTogU3Vic2FtcGxlIG1vZGUgc3Vib3B0aW1hbCBmb3IgWUNiQ3I0OjI6MgoKTGV3aXMgSHVhbmcg
KDEpOgogIGRybS9hbWQvZGlzcGxheTogcmVmaW5lIGkyYyBvdmVyIGF1eAoKTmlrb2xhIENvcm5p
aiAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgYmFjayBzdXBwb3J0IGZvciBEU0MgNDoyOjIg
U2ltcGxlCiAgZHJtL2FtZC9kaXNwbGF5OiBjb25maWcgdG8gb3ZlcnJpZGUgRFNDIHN0YXJ0IHNs
aWNlIGhlaWdodAoKUWluZ3FpbmcgWmh1byAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiByZXBsYWNl
IEZJWE1FIHdpdGggVE9ETwoKVml0YWx5IFByb3N5YWsgKDEpOgogIGRybS9hbWQvZGlzcGxheTog
UmV1c2UgZGNuMiByZWdpc3RlcnMKCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgfCAgIDkgKy0KIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
X2hlbHBlcnMuYyB8ICAxMCArLQogLi4uL2RjL2Nsa19tZ3IvZGNlMTEwL2RjZTExMF9jbGtfbWdy
LmMgICAgICAgIHwgICA3ICstCiAuLi4vZGlzcGxheS9kYy9jbGtfbWdyL2RjbjEwL3J2MV9jbGtf
bWdyLmMgICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMu
YyAgICAgIHwgMTI1ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
X2xpbmsuYyB8ICAxOCArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
X2RkYy5jIHwgIDg3ICsrLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
X2RwLmMgIHwgIDExICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3Mu
YyAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAg
ICAgIHwgICA5ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfZHNjLmggICAg
ICAgfCAgMTQgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19od190eXBlcy5o
ICB8ICA4NiArLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19saW5rLmggICAg
ICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfc3RyZWFtLmggICAg
fCAgMjAgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3R5cGVzLmggICAgIHwg
IDE1ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jICB8ICAg
MyAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9kbWN1LmMgfCAgIDMg
LQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX21lbV9pbnB1dC5jICAgIHwgICA0ICst
CiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJjZS5jICAgfCAgMTYgKy0K
IC4uLi9hbWQvZGlzcGxheS9kYy9kY2UxMjAvZGNlMTIwX3Jlc291cmNlLmMgICB8ICAxMSArLQog
Li4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5oIHwgIDE2ICsKIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wcC5jICB8ICAgNSArLQogLi4u
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3BwLmggIHwgICAyICsKIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RwcC5oICB8ICA4NCArLS0KIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jICB8ICAgMiArLQogLi4uL2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jICAgIHwgNTc0ICsrKysrKysrKysr
KystLS0tLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5oICAgIHwg
IDE0ICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8ICAg
MyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX2hlbHBlcnMuaCAgIHwgICAy
ICstCiAuLi4vZGMvZG1sL2RjbjIwL2Rpc3BsYXlfcnFfZGxnX2NhbGNfMjAuYyAgICAgfCAgIDgg
Ky0KIC4uLi9kYy9kbWwvZGNuMjAvZGlzcGxheV9ycV9kbGdfY2FsY18yMHYyLmMgICB8ICAgOCAr
LQogLi4uL2Rpc3BsYXkvZGMvZG1sL2RtbDFfZGlzcGxheV9ycV9kbGdfY2FsYy5jIHwgIDEwICst
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jICAgfCAgODUgKyst
CiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fYmFzZS5jICAgfCAgIDIgLQog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2VydmljZS5jICAgIHwgICAyIC0KIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RkYy5oICB8ICAgMyArCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RzYy5oICAgfCAgMTIgKy0KIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9od19zZXF1ZW5jZXIuaCB8ICAgMyArCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL3Jlc291cmNlLmggfCAgIDIgKwogMzkgZmlsZXMg
Y2hhbmdlZCwgODg5IGluc2VydGlvbnMoKyksIDQwMyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
