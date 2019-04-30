Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6B10178
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3E589225;
	Tue, 30 Apr 2019 21:09:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300F089225
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:09:55 +0000 (UTC)
Received: from SN1PR12CA0068.namprd12.prod.outlook.com (2603:10b6:802:20::39)
 by DM6PR12MB3753.namprd12.prod.outlook.com (2603:10b6:5:1c3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.10; Tue, 30 Apr
 2019 21:09:53 +0000
Received: from BY2NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by SN1PR12CA0068.outlook.office365.com
 (2603:10b6:802:20::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:09:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT031.mail.protection.outlook.com (10.152.84.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:09:53 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/20] drm/amd/display: add support for disconnected eDP panels
Date: Tue, 30 Apr 2019 17:09:07 -0400
Message-ID: <20190430210938.32335-10-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(2616005)(70586007)(186003)(77096007)(26005)(336012)(5660300002)(305945005)(47776003)(1076003)(8676002)(50226002)(8936002)(486006)(81166006)(81156014)(6916009)(446003)(11346002)(126002)(476003)(426003)(6666004)(356004)(68736007)(16586007)(86362001)(2906002)(316002)(51416003)(4326008)(76176011)(53936002)(70206006)(72206003)(14444005)(478600001)(50466002)(36756003)(2351001)(53416004)(7696005)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3753; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac59efc1-fc69-46f2-88b5-08d6cdb030bc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB3753; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3753:
X-Microsoft-Antispam-PRVS: <DM6PR12MB37532DD5E4230CE849E8799BF93A0@DM6PR12MB3753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Wi9zbirMm0caIbEWv/cT+rFYY021ujzDMiwaxKMsRGVrJGuPhkTfZaOCWWLU7uL1mDNPhVfVZ45xKnkHXJuLJsSdFApVFkT/B1jMQX1TKzsn3jdwiZIK2YV/hMMk/zbKX+nmw6eyZReYWfL7x0HQrK0QPmuICIfcZckP5rZ2NVvpr5ieHxPVJ/M3JlFgm5aIx6Zb9+qfpzD7nm2BHK9WAAx6/2T5ncDaGJPAf1fouP/lgoVrwf0aOGn4MCo46PmgGbwI3RkqnBSWRwG4n+n4mz1A3JwcRnOPxZg7wjfJFpo4KnHxTJEutd0/tfCncXPHr2yNn2kZ0sDHwl8UWPAufrHjxONw8MhSP1tkzbBm2wqxdGT2H84Qx8lPd0SjhPb4pwxzwr1MLKlyf2Q2F615qOITwv99pRuj/xl3NQ7mzmY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:09:53.3212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac59efc1-fc69-46f2-88b5-08d6cdb030bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3753
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbMr5brXaGEmHnslgMskm3dzlcxwFiFXzKhOmdOnMdg=;
 b=V3rL1ZSpt3L7YIx23ncD8Zh98yJee0Z1OABtTzq9dxWrhyv6dK6GAQCj8JrtkwxemCBeOyPqkuHfZPuj8EZoB1w1zbPaUmIuQlYZIACJY5fUda8SwAwHlLkc8SCSfr8yuZjzswhBuT1GgriDh3GSjDuO+GxkTpdhKrlBaCPhj6k=
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
Cc: Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KT24gc29tZSBjb25maWd1cmF0
aW9ucywgZURQIGZyb20gR1BVIGlzIG11eGVkIHdpdGggYW5vdGhlciBHUFUuICBEQyBkb2VzCm5v
dCBrbm93IHN0YXRlIG9mIG11eCwgYnV0IERNIGhhcyB0aGlzIGtub3dsZWRnZS4gIFRoaXMgZmxh
ZyBhbGxvd3MgREMgdG8gaWdub3JlCmNyZWF0aW5nIEVEUCBsaW5rIHdoZW4gRE0gaW5mb3JtcyBE
QyB0aGF0IEVEUCBtdXggaXMgbm90IGNvbm5lY3RlZC4KCltob3ddCkFkZCBmbGFnIHRvIGRjLCBw
b3B1bGF0ZSBmbGFnIGluIERNCgpDaGFuZ2UtSWQ6IElhNTAxOGRjZjUyNDc2Y2FkNDQ4YzAyYjU5
Y2IzZjhmM2U1OTg1NmQxClNpZ25lZC1vZmYtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJo
YXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCAxMSArKysrKysrKy0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IDA0NjM1YjdhMjdjNy4uMDY4OWYzOTJhNTA2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTE3NSw5ICsxNzUsMTQg
QEAgc3RhdGljIGJvb2wgY3JlYXRlX2xpbmtzKAogCQlsaW5rID0gbGlua19jcmVhdGUoJmxpbmtf
aW5pdF9wYXJhbXMpOwogCiAJCWlmIChsaW5rKSB7Ci0JCQlkYy0+bGlua3NbZGMtPmxpbmtfY291
bnRdID0gbGluazsKLQkJCWxpbmstPmRjID0gZGM7Ci0JCQkrK2RjLT5saW5rX2NvdW50OworCQkJ
aWYgKGRjLT5jb25maWcuZWRwX25vdF9jb25uZWN0ZWQgJiYKKwkJCQkJbGluay0+Y29ubmVjdG9y
X3NpZ25hbCA9PSBTSUdOQUxfVFlQRV9FRFApIHsKKwkJCQlsaW5rX2Rlc3Ryb3koJmxpbmspOwor
CQkJfSBlbHNlIHsKKwkJCQlkYy0+bGlua3NbZGMtPmxpbmtfY291bnRdID0gbGluazsKKwkJCQls
aW5rLT5kYyA9IGRjOworCQkJCSsrZGMtPmxpbmtfY291bnQ7CisJCQl9CiAJCX0KIAl9CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggMTgzOTI0YWZmYzkxLi5hMzcxOTIxYjdj
NTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0yMDgsNiArMjA4LDcgQEAg
c3RydWN0IGRjX2NvbmZpZyB7CiAJYm9vbCBkaXNhYmxlX2ZyYWN0aW9uYWxfcHdtOwogCWJvb2wg
YWxsb3dfc2VhbWxlc3NfYm9vdF9vcHRpbWl6YXRpb247CiAJYm9vbCBwb3dlcl9kb3duX2Rpc3Bs
YXlfb25fYm9vdDsKKwlib29sIGVkcF9ub3RfY29ubmVjdGVkOwogfTsKIAogZW51bSB2aXN1YWxf
Y29uZmlybSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
