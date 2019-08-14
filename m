Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680D8DF05
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288076E83C;
	Wed, 14 Aug 2019 20:40:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820044.outbound.protection.outlook.com [40.107.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5D46E83C
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh1EKYr4ffd07Br5NsY7JVo0jKiau0l9nyk+c4GtiHZUP70A9FUwHnowJjFDFbhzkQrDM5Eg97oFVUBtEeJZbqjq5PODMJ8Qj8ILC+C3+gfmjdjfuYjrisOXWpAUbxhWWrm86eZNn55xKqSTlAIxEv5966zbCHoxXjNtMLkV2XwkmiQJfVS1kh+4Wb8MdEVeVLZfjMHn+N/5c0XEronQUabo82Nkzn5pfUoylanbDl23uvgC5WUSpHUMv5dpv26AXFe1kKKI3qiRqUIclUiGhA6BY4GXMVoDfM7fHszwXB+o9nzJRj+z1DL8J1ozCan5lmkRz3LWRp/VeoRmWMWRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+akQfHXvnQpTdOMiN2cHO6BdpauaQXwOVtL++gi2SE=;
 b=NnH1QT/OoAnmpmJo+RHCrkfQ+IOx446HrbFZ4hrM+i3ZtD3JUuPDi6XDrK3XfilLj8QT2giRb/A9BmuN5+n6QPhs6jVGg75OG+iM9ZOMR36eqiWH/YmjGumDRiHBklNAPZqazuQRbW78EAopUsg58ex2icAlSvQOOA4Gin4Lj9k5Gk/bWZoFicacgU6HbNS1IPK5PjcxnxakJdnlsUPfjYAtq3luCfzUVcI60bC94u5AQsMzJpmM2zbjrrWEArfGs0AZvQphNLGwzGfsWLfJRmpxFsC5Tuey84wNSvHGnZj10yKKs4ULOB/ZHVaShue95LSv7QbqA4yg69CyPbYecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0020.namprd12.prod.outlook.com
 (2603:10b6:910:16::30) by BN6PR12MB1521.namprd12.prod.outlook.com
 (2603:10b6:405:f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.14; Wed, 14 Aug
 2019 20:40:31 +0000
Received: from CO1NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by CY4PR1201CA0020.outlook.office365.com
 (2603:10b6:910:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.18 via Frontend
 Transport; Wed, 14 Aug 2019 20:40:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT024.mail.protection.outlook.com (10.152.80.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 14 Aug 2019 20:40:30 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 14 Aug 2019 15:40:29 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/5] drm/amd/powerplay: Fix meaning of 0x1E PPSMC_MSG
Date: Wed, 14 Aug 2019 16:40:13 -0400
Message-ID: <1565815217-9533-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(2980300002)(428003)(189003)(199004)(19627235002)(426003)(446003)(305945005)(476003)(11346002)(47776003)(4326008)(14444005)(186003)(336012)(44832011)(53416004)(126002)(2616005)(486006)(8676002)(26005)(4744005)(76176011)(7696005)(51416003)(81166006)(16586007)(2351001)(70206006)(81156014)(2906002)(53936002)(316002)(478600001)(50466002)(50226002)(5660300002)(8936002)(36756003)(86362001)(54906003)(48376002)(6666004)(356004)(6916009)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1521; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c524ec1-df02-4954-2561-08d720f7a5d7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1521; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1521:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1521616B1F27BB90F0994F9CEAAD0@BN6PR12MB1521.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-Forefront-PRVS: 01294F875B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FNzoOQUrwfwYDJmhVBgdYtPZk2IYMwK+zFHG8+OKWr2+c1wdJ5rucUfRVANHe7hm98CgTEs9ElxA+ZMogLQsP4RzBB1ze8IU0JprBDovKyuE3j3psLn2srjgoE2X5NduAbaOjdug09AjLl6wPTenEcEVBBmIT0F5xb8aOmTGW2RoZHQSlQZ45hx/ReGRllCRpczVzkiw7TYB/SMhiZ9OcYeX8aiR4FdBIN1wlIluC1z1hnk5tXjKr7ahahra2Aa8NqpwejPq3DzeA9XtuX6SXH/f4yAz4ivUVsfV4N8vbCDtRaQNjxmb6dYBjN786HQ+CIFSorYhfYex3lwAtp8AYzdll46zlBKl8Wb83PUnKh9M2VacpyDLaeF/QBPcPYGhqIoMF9mgE57whbKL5rQ2UgExZ61E3Tg6WOtiKqLM0BY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 20:40:30.5606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c524ec1-df02-4954-2561-08d720f7a5d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1521
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+akQfHXvnQpTdOMiN2cHO6BdpauaQXwOVtL++gi2SE=;
 b=DFpRPi7U4MjoI8k9WARQPkiTherr/A2q/jNIbwWxQrhXobw2d70la3GQ3asj2KY4wwL1lo7CYLbd6XfY63hcX2dWvBVbbMo6FzoZeup8poHE0hhucZCZMAcxmeXrxjbhyaB/Dc58jzPtqbzcB5GsGQnZk+sD5MCwx3S07gZQpNQ=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 evan.quan@amd.com, Shirish.S@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QnkgY29tcGFyaW5nIHRvIHdpbmRvd3MgaXQgbWVhbnMgQVNJQyByZXNldC4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvcnZfcHBzbWMuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9ydl9wcHNtYy5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvaW5jL3J2X3Bwc21jLmgKaW5kZXggOTA4NzllNC4uZGY0Njc3ZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3J2X3Bwc21jLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3J2X3Bwc21jLmgKQEAgLTU5LDcg
KzU5LDcgQEAKICNkZWZpbmUgUFBTTUNfTVNHX1NldERyaXZlckRyYW1BZGRyTG93ICAgICAgICAg
IDB4MUIKICNkZWZpbmUgUFBTTUNfTVNHX1RyYW5zZmVyVGFibGVTbXUyRHJhbSAgICAgICAgIDB4
MUMKICNkZWZpbmUgUFBTTUNfTVNHX1RyYW5zZmVyVGFibGVEcmFtMlNtdSAgICAgICAgIDB4MUQK
LSNkZWZpbmUgUFBTTUNfTVNHX0NvbnRyb2xHZnhSTSAgICAgICAgICAgICAgICAgIDB4MUUKKyNk
ZWZpbmUgUFBTTUNfTVNHX0RldmljZURyaXZlclJlc2V0ICAgICAgICAgICAgIDB4MUUKICNkZWZp
bmUgUFBTTUNfTVNHX1NldEdmeGNsa092ZXJkcml2ZUJ5RnJlcVZpZCAgIDB4MUYKICNkZWZpbmUg
UFBTTUNfTVNHX1NldEhhcmRNaW5EY2VmY2xrQnlGcmVxICAgICAgIDB4MjAKICNkZWZpbmUgUFBT
TUNfTVNHX1NldEhhcmRNaW5Tb2NjbGtCeUZyZXEgICAgICAgIDB4MjEKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
