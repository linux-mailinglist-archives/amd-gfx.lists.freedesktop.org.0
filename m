Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FDF69DB1
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7495E89C48;
	Mon, 15 Jul 2019 21:21:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B314E89C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCGV9TYYf3Ih0lY0BLCvfb7T+kLhwf48Ryx4QykBbLdIU8ocIJ2R6EtVS6yjI/MltMFhJnmg5h46722l0sEp91CQ4mO5JZ6wwz3dOGIhYwCKbXdIqfC63Grl21udZ5onZbK69z8jJXgWe3rpgKNV+4EG/Fz07KWSm10TkW4ThVjV+AjB/rw78301hSB7pQ/hqQ/nStWDK+DA3klDqyVucsYi2F9Bmgt+C1+WCWSqmU0AJdxx5tqonbVNF0pLCtrkboX5CPW8nkrHD5T5N6UsjMHif20wtzhlLJKjbCqUwU1dbtt61ccrRGZOxHIyXfBnrxrYvuBDFRobuJUN8cWqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edYPYdRPkNk24gM8D2MvNRKjdXDZmO5TI6BJOh9Fo0c=;
 b=AXZ2o6XaaGOke9Lgja2QisZK9zL9SHDNzc5/+0Z11SwaGmUGru0GA3kTlfFU9az9EiZ6zOzBa6k0TCK76p08qN9LnKSIXUwjHURdyLTD6KPKWNhjRpHJJDZqB+v314NX7GQSrjS1j+lTMg1K6LRjxW/cz8CY/Ymvkw3fWlvChkt2Hih2X1dacM9O0wbCiD1idMCM5YPz6S/8jJRQT65TYtHi/yC5UgNOAmypYWzOHa3FNYR8vcvj2AQn+XZNzl5Il1/cxA5uPy89w4/mMrc7sm/YBsvZMxi8A4DsUvtEPhI61Bwz4o/RO4CUqL9aPRxWEOkUR9VmQpCvoK0YoBjLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:33 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:32 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:20 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 30/87] drm/amd/display: Wait for backlight programming
 completion in set backlight level
Date: Mon, 15 Jul 2019 17:19:52 -0400
Message-ID: <20190715212049.4584-31-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(2906002)(1076003)(5660300002)(54906003)(81156014)(70586007)(36756003)(70206006)(6916009)(305945005)(2870700001)(68736007)(81166006)(316002)(8676002)(478600001)(50226002)(8936002)(2616005)(86362001)(76176011)(26005)(446003)(476003)(53936002)(51416003)(11346002)(186003)(48376002)(126002)(356004)(6666004)(50466002)(486006)(4326008)(2351001)(47776003)(426003)(49486002)(336012)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3922; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24c64267-874c-44e0-bf3d-08d7096a68c3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3922; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3922:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39225DA3E8D22DEDE4BA3E8282CF0@BY5PR12MB3922.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fbeZ1wbg211Ou6Tsb7U0OwFfvVeDEBf2g5mKUGkB6kTncMibHfrn+TujwUCplY24j+uo8RJ18xKAwgrtIv6hu0W6QWxm6yQrYjiKPjWb5npZ71hrzlWdN1zkyK3Aa8xklMXe7v++kOevDv1Jm7/ox9EKBnV7jRjiunHMnyT5sWQgGPQqDZ6jClQTrmb5hmj2Bh0Dq+KxCz3xtl6CxsZQ+t/FXqCfmUHYpUkhGIYuGt8ZM8Uqgu94xHo2aOgd+w6gmasUYsFX+C3GOPUSQduW+GjnaiWvHuJJPkBJRQMExYIdx01Vi0EUqjCWD3w7BovUd08PZXzU04ATjBNrNu0HRglCENGH83H1szl9Toca5UiitQnCufdn99s9WCtiEyEtHOJxEYpcAp4DhKoMIYrY76+1H15xYB1re2Z2tCY4Xj0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:32.3125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c64267-874c-44e0-bf3d-08d7096a68c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3922
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edYPYdRPkNk24gM8D2MvNRKjdXDZmO5TI6BJOh9Fo0c=;
 b=exZd3hmdkjGX3SCYvFWa4WFt1WluuIo5pOjsBZBR5JIsSyJNjsi3O99FknRS6fx6X8p9DVl6AMZZjwvLunzWHjOYFJ4TFAe3tJqVEFlN/IvgrZNxEmVx7l16xM3DdMr1afRP1DsJCmU+ZM2a1kG85k01Tf4K8ua0z/mGTjBAxsM=
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 SivapiriyanKumarasamy <sivapiriyan.kumarasamy@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2l2YXBpcml5YW5LdW1hcmFzYW15IDxzaXZhcGlyaXlhbi5rdW1hcmFzYW15QGFtZC5j
b20+CgpbV0hZXQpDdXJyZW50bHkgd2UgZG9uJ3Qgd2FpdCBmb3IgYmxhY2tsaWdodCBwcm9ncmFt
bWluZyBjb21wbGV0aW9uIGluIERNQ1UKd2hlbiBzZXR0aW5nIGJhY2tsaWdodCBsZXZlbC4gU29t
ZSBzZXF1ZW5jZXMgc3VjaCBhcyBQU1Igc3RhdGljIHNjcmVlbgpldmVudCB0cmlnZ2VyIHJlcHJv
Z3JhbW1pbmcgcmVxdWlyZXMgaXQgdG8gYmUgY29tcGxldGUuCgpbSG93XQpBZGQgZ2VuZXJpYyB3
YWl0IGZvciBkbWN1IGNvbW1hbmQgY29tcGxldGlvbiBpbiBzZXQgYmFja2xpZ2h0IGxldmVsLgoK
U2lnbmVkLW9mZi1ieTogU2l2YXBpcml5YW5LdW1hcmFzYW15IDxzaXZhcGlyaXlhbi5rdW1hcmFz
YW15QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbnRob255IEtvbyA8QW50aG9ueS5Lb29AYW1kLmNv
bT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZS9kY2VfYWJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
L2RjZV9hYm0uYwppbmRleCAzZDg3YTg4MDAzMDAuLmFkZGU3YTU3NjBiYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMKQEAgLTIzNyw2ICsyMzcsMTAg
QEAgc3RhdGljIHZvaWQgZG1jdV9zZXRfYmFja2xpZ2h0X2xldmVsKAogCXMyIHw9IChiYWNrbGln
aHRfOF9iaXQgPDwgQVRPTV9TMl9DVVJSRU5UX0JMX0xFVkVMX1NISUZUKTsKIAogCVJFR19XUklU
RShCSU9TX1NDUkFUQ0hfMiwgczIpOworCisJLyogd2FpdERNQ1VSZWFkeUZvckNtZCAqLworCVJF
R19XQUlUKE1BU1RFUl9DT01NX0NOVExfUkVHLCBNQVNURVJfQ09NTV9JTlRFUlJVUFQsCisJCQkw
LCAxLCA4MDAwMCk7CiB9CiAKIHN0YXRpYyB2b2lkIGRjZV9hYm1faW5pdChzdHJ1Y3QgYWJtICph
Ym0pCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
