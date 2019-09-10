Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB4BAEC63
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC5A8926C;
	Tue, 10 Sep 2019 13:54:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D888926C
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWLttZHbFjL4nSi6GGF/DHJMi+hUidSiBSidWNM5mUIEW1VYrTsps3yqjI+gpG69Lox+jN8lGASOfy+OdNiZ8DFdC0puTuijlxeUVf2aWqUgt/5X1TeB9Wg6qdTcpD9PdPGfJghOqFLTyawJtej7T12exkx+wpkmzEK+CQMpA9cDv4D9GW7u8bETfZno27MvL5M0jvi691q+KN/sfKeZRttyD6wJKfgMOoD0pAidsrcG4KPzHX/6jP+OrQ74gBoJn41pYDttlGQyMlrqJ2HpzDS1Z2Yft7xCs10RLhj8QcfpGZCiuEE3shQMMfGkpWWNQMhESg53JOyKFo5OTQhFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWVcObMqn72050Oo8DzNS+PebR13sU9X47IfTLADkWI=;
 b=iWGGQtv18rhvxB8tVTyyF6tNoUQK83s1srsX33PsjH3cxnzVJkJcRgofxvmxCKUD0g7/U8Gie4CpSf1IDFgA6Nl29WOcEUMQGmHZliIWF56XWcPjf4b/E5KIcUDifqWyFr2sI/zipOs8V7Iam6Ez5il56HRjyV4K+yabqXCSGtPIrEoLCcLKBtYEMVZDV50WJAgGzBOtcay6vpxp8+a80x1617FgxVnJ1KXngx2CJFzKlYsGBSxSG+d3hb6ubHVZmDblhVR2Qcvf+e/j6pGtjNixGngDXMLZ2ZffUXF9wkYvMkoTOBCdAaknrgqSkpKkd9BsY8j2S0kqx9qG09AUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by DM5PR1201MB2507.namprd12.prod.outlook.com (2603:10b6:3:e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:54:57 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:54:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:54:56 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:52 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/25] DC Patches 09 Sep 2019
Date: Tue, 10 Sep 2019 09:54:20 -0400
Message-ID: <20190910135445.18300-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(428003)(189003)(199004)(356004)(486006)(2616005)(8936002)(47776003)(336012)(8676002)(2876002)(81166006)(2906002)(81156014)(426003)(50466002)(50226002)(70586007)(48376002)(70206006)(53936002)(14444005)(186003)(305945005)(5660300002)(26005)(6916009)(1076003)(49486002)(476003)(126002)(4326008)(6666004)(86362001)(36756003)(2351001)(316002)(51416003)(478600001)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2507; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da1152e4-b5a7-4093-3c52-08d735f676e5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB2507; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2507:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2507BE26DA949858C37F4A8882B60@DM5PR1201MB2507.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zQlGpcXBll4wEaQ7MZvkV5jJ6Paa+XcdYqIQcbGzvWUp4ZXKe7UXvlm5PlNCkIqMLml1z3OKxl8Vk0ns482AIbq/QrVaEOLXU4ozkvdhQejk0ED7SKM74UOtPBLXCa+xcJZZyNegGmg1xhgzeU2phipUr33Vx9c3kNQwm8QhiftB9WPitQ6d0yZ4YlC8m0Q4fPnj6BJ17H58gbtCpO2zKra7ex3329uNSGrL4DnqGtnIakvU6MVcQAR+o7DtmXwBn9OuXp0K2xYM/pgAi9kuOLg+E4HJj4z6miOEctSIkt11pzb+m9zpMxirIug004/Eipd5z0eLxc97AvZXx1QLl8gufuh3JBeh04tkeX1H0aVHq56mXsgLxmo8w/PGxqRYoFIanzJMvAMukg7JAqU+yUeOHYPVIVdEKkuev0DbAF8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:54:56.7244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1152e4-b5a7-4093-3c52-08d735f676e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2507
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWVcObMqn72050Oo8DzNS+PebR13sU9X47IfTLADkWI=;
 b=0r7YjQuHSw2zi1WNsV6cdWyrynywJzGPXsXRbAudnwO+p52WoiOZ2H0cfgYJ0aUF9TWEAPJ9oSXwjuy52NOy4cfXHlcpl4CK1E3h1ZRhLBGRLa5Ys0bZZSbTBkLqzu925OJlD+QW5erkopPclHKjM1apl7/G+tcWTF/50u5uwcg=
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpTdW1tYXJ5IG9mIGNoYW5nZToKCiog
Rml4IHBpcGUgc3BsaXQgd2l0aCBEU0Mgb24gaGlnaCBiYW5kd2lkdGggdGltaW5ncyAoOGtANjAs
IDRrQDE0NCkKKiBJbXByb3ZlIGZyZWVzeW5jIGxvdyBmcmFtZSByYXRlIGNvbXBlbnNhdGlvbiAo
ZnJhbWUgZG91YmxpbmcpIGJlaGF2aW9yCiogVXBkYXRlIEFCTSBwYXJhbWV0ZXJzLCBsaW1pdCBt
aW5pbXVtIGFkanVzdG1lbnQKKiBNaXNjLiByZWZhY3RvcnMgYW5kIGZpeGVzCgoKQW50aG9ueSBL
b28gKDEpOgogIGRybS9hbWQvZGlzcGxheTogc2V0IG1pbmltdW0gYWJtIGJhY2tsaWdodCBsZXZl
bAoKQXJpYyBDeXIgKDQpOgogIGRybS9hbWQvZGlzcGxheTogMy4yLjUwCiAgZHJtL2FtZC9kaXNw
bGF5OiAzLjQuNTEKICBkcm0vYW1kL2Rpc3BsYXk6IDMuNC41MS4xCiAgZHJtL2FtZC9kaXNwbGF5
OiBJbXByb3ZlIExGQyBiZWhhdmlvdXIKCkRteXRybyBMYWt0eXVzaGtpbiAoNSk6CiAgZHJtL2Ft
ZC9kaXNwbGF5OiBhZGQgYWRkaXRpb25hbCBmbGFnIGNvbnNpZGVyYXRpb24gZm9yIHN1cmZhY2Ug
dXBkYXRlCiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgdnRnIHVwZGF0ZSBhZnRlciBnbG9iYWwgc3lu
YyB1cGRhdGUKICBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBnbG9iYWwgc3luYyBwYXJhbSBleHRyYWN0
aW9uIGluZGV4aW5nCiAgZHJtL2FtZC9kaXNwbGF5OiB1cGRhdGUgb2RtIG1vZGUgdmFsaWRhdGlv
biB0byBiZSBpbiBsaW5lIHdpdGggcG9saWN5CiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgZGV0aWxl
IGJ1ZmZlciBzaXplIGZvciBEQ04yMAoKSWx5YSBCYWtvdWxpbiAoMSk6CiAgZHJtL2FtZC9kaXNw
bGF5OiBGaXggSFVCUCBzZWNvbmRhcnkgdmlld3BvcnQgcHJvZ3JhbW1pbmcKCkpvc2lwIFBhdmlj
ICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IGRlZmluZSBwYXJhbWV0ZXJzIGZvciBhYm0gMi4zCgpK
dWxpYW4gUGFya2luICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IFNlcGFyYXRlIGhhcmR3YXJlIGlu
aXRpYWxpemF0aW9uIGZyb20gY3JlYXRpb24KCkxld2lzIEh1YW5nICgxKToKICBkcm0vYW1kL2Rp
c3BsYXk6IGZpeCBpMmMgd3RpcmUgbW90IGluY29ycmVjdCBpc3N1ZQoKTWFydGluIExldW5nICgy
KToKICBkcm0vYW1kL2Rpc3BsYXk6IGVuYWJsZSBzaW5nbGUgZHAgc2VhbWxlc3MgYm9vdAogIGRy
bS9hbWQvZGlzcGxheTogZml4IHVzZSBvZiB1bmluaXRpYWxpemVkIHZhcmlhYmxlCgpNYXJ0aW4g
VHNhaSAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBIYW5kbGUgdmlydHVhbCBzaWduYWwgdHlwZSBp
biBkaXNhYmxlX2xpbmsoKQoKTWlraXRhIExpcHNraSAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBS
ZWJ1aWxkIG1hcHBlZCByZXNvdXJjZXMgYWZ0ZXIgcGlwZSBzcGxpdAoKTmlrb2xhIENvcm5paiAo
MSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBTZXQgbnVtYmVyIG9mIHBpcGVzIHRvIDEgaWYgdGhlIHNl
Y29uZCBwaXBlIHdhcwogICAgZGlzYWJsZWQKClN0eWxvbiBXYW5nICgxKToKICBkcm0vYW1kL2Rp
c3BsYXk6IEFkZCBkZWJ1Z2ZzIGVudHJ5IHRvIGZvcmNlIFlVVjQyMCBvdXRwdXQKCldlc2xleSBD
aGFsbWVycyAoNCk6CiAgZHJtL2FtZC9kaXNwbGF5OiBSZXBsYWNlIGZvciBsb29wIHcvIGZ1bmN0
aW9uIGNhbGwKICBkcm0vYW1kL2Rpc3BsYXk6IERvIG5vdCBkb3VibGUtYnVmZmVyIERUTyBhZGp1
c3RtZW50cwogIGRybS9hbWQvZGlzcGxheTogUmV2ZXJ0IGZpeHVwIERQUCBwcm9ncmFtbWluZyBz
ZXF1ZW5jZQogIGRybS9hbWQvZGlzcGxheTogT3B0aW1pemUgY2xvY2tzIG9uIGNsb2NrIGNoYW5n
ZQoKWmhhbiBMaXUgKDEpOgogIGRybS9hbWQvZGlzcGxheTogQWRkIG1pc3NpbmcgSEJNIHN1cHBv
cnQgYW5kIHJhaXNlIFZlZ2EyMCdzIHVjbGsuCgogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jIHwgIDEyICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmggfCAgIDEgKwogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1fZGVidWdmcy5jIHwgIDMxICsrKysKIC4uLi9kYy9jbGtfbWdyL2RjZTExMC9kY2UxMTBf
Y2xrX21nci5jICAgICAgICB8ICAxOCArKy0KIC4uLi9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAv
ZGNuMjBfY2xrX21nci5jICB8IDEzMiArKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAgICB8ICAzOCArKy0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwgIDYzICsrKysrKy0tLQogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RkYy5jIHwgICA0ICstCiAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgfCAgMjYgKystLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgIHwgIDEyICstCiAuLi4vZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmMgfCAgIDggKysKIC4uLi9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h1YnAuaCB8ICAxMiArKwogLi4uL2FtZC9k
aXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIHwgICAzICstCiAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kY2NnLmMgfCAgNTIgKy0tLS0tLQogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZGNjZy5oIHwgICAyICstCiAuLi4vZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h1YmJ1Yi5jICAgfCAgMTIgKy0KIC4uLi9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHViYnViLmggICB8ICAgMSArCiAuLi4vZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgICAgfCAgMTEgKy0KIC4uLi9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX29wdGMuYyB8ICAgNCArCiAuLi4vZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAgMjkgKy0tLQogLi4uL2RjL2RtbC9k
Y24yMC9kaXNwbGF5X21vZGVfdmJhXzIwdjIuYyAgICAgIHwgICA5ICstCiAuLi4vZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9pbmMvY29yZV90eXBlcy5oICAgfCAgIDEgKwogLi4uL2FtZC9kaXNwbGF5
L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmggIHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2RjY2cuaCAgfCAgIDMgKy0KIC4uLi9hbWQvZGlzcGxheS9t
b2R1bGVzL2ZyZWVzeW5jL2ZyZWVzeW5jLmMgICB8ICAzMiArKystLQogLi4uL2FtZC9kaXNwbGF5
L21vZHVsZXMvaW5jL21vZF9mcmVlc3luYy5oICAgIHwgICAxICsKIC4uLi9hbWQvZGlzcGxheS9t
b2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuYyB8ICA5MyArKysrKystLS0tLS0KIC4uLi9hbWQv
ZGlzcGxheS9tb2R1bGVzL3Bvd2VyL3Bvd2VyX2hlbHBlcnMuaCB8ICAgMSArCiAyOCBmaWxlcyBj
aGFuZ2VkLCAzMTUgaW5zZXJ0aW9ucygrKSwgMzA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
