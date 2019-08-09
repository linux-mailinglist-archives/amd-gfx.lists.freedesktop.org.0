Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BA88507
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920596EEC2;
	Fri,  9 Aug 2019 21:38:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDB56EEB9
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReU6eY2/6ViAJlYJUDm9G8NNAxFFYOm4eIjSjNp1md5IcDaVnpp5mLg1jAW9tB35+25hLi6WyYVEt/as9/WHljBpfetTfxLlqaAVwsTOGhLpXOr61jPzp/NKgOa1lBlmgCGhqKFWKRjNy43HchqzcL8N1RfDr4j8HVd3z4TP4Vb610tLZ317usgLSmQykGTwITc+4NfISbD4WPnm3+slqfYOabfwqO8uKsm5HfK1H6gdX9h+Q8pbm9Di+7mc0YF11Bd4PcE83bsO0Ytzmenv/Yj5OATuBPtLKyGvn/2kjxnmiJ6B1U99RCpod32UfyFFJY00lOSNL6jfDYg61soGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I/B8kBiF0vIv7mbbjcwXsyF+g/pZcHBrRO/ajkgvzU=;
 b=e4fTmf2LkR9Bs5b/lkdFWupgbPDfemz1qldBpbj6Idz6d+F7q5TczPplylcEQ4SqdPOUHuKxXNNOm3IEH5RPBBLJ6V0EWSZSzo+DVUC/D/XMA6qZSr3jDik2YesxuqMAH4blPYo8zCBvV+cGHfdTUEDb6Y4XSU01zzuw9bA7N0aFbACjNSu0x5pttFfX9dOEw46JCT4V24vIedZlMXZRECIQioIRNSg6uP71FEDkL4xLgkzfDbR6XJa6jsknHfWsCQQxOJQOi41d+inXvqgX69Mh0jBY+PEoAujxv4893rTwxrpEZwaUG3X+nAhZZa0uqNRwv4n2q0/27UFnwcIY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:910:16::12) by CY4PR12MB1270.namprd12.prod.outlook.com
 (2603:10b6:903:43::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.13; Fri, 9 Aug
 2019 21:38:42 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by CY4PR1201CA0002.outlook.office365.com
 (2603:10b6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:42 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:38 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 30/49] drm/amd/display: reprogram VM config when system resume
Date: Fri, 9 Aug 2019 17:37:23 -0400
Message-ID: <20190809213742.30301-31-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(54906003)(50466002)(305945005)(316002)(48376002)(2351001)(476003)(47776003)(478600001)(4326008)(126002)(486006)(446003)(49486002)(426003)(2616005)(11346002)(336012)(186003)(5660300002)(86362001)(76176011)(51416003)(70586007)(26005)(70206006)(6916009)(8676002)(81156014)(81166006)(356004)(6666004)(8936002)(2870700001)(36756003)(1076003)(14444005)(2906002)(50226002)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa70a324-681e-4f4b-1be2-08d71d11f31e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1270125E0A7C959AACC05B9F82D60@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /+Fo8GWSXBMcykInTnrxlL7SKJvVoLFsRGEk9c0FCmYOgR8mCAl2yiKHKB5voLk1lQgo/BbN6VFXv9zAWOqpw/pOmlc1Banu/aQBVsm20RDX7w99C2kxpyI0Y0KbgV12/Tf/bB+MQzaJ7X1k7yQ4GJ5uqXdbQuvcXqbP33LcHMn+w4Irleiz9XKzRdxcVI0zAdXHJNPfsO+1PVnW5xnQkFwW+Ky8zetzydRp23QughQ+Qz5PBnlMHkSjMq/gDEBd/EaBgmAH1HP5yZTMQaYds+oDbTwJclb6cL/10e8UfL5/NF0rZOWEhFcHmbo7HaHMlwt1/QhwEx9gJPCiwYiwojJ1LzO3ec3nqyBBefaC92r/yrbCohd/5lvPpMwupvIQ3laYZ2fz7ScRgi3zk0nqAMU5MEsvBrqLZ2qu86GvOYg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:42.5649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa70a324-681e-4f4b-1be2-08d71d11f31e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I/B8kBiF0vIv7mbbjcwXsyF+g/pZcHBrRO/ajkgvzU=;
 b=0YgzXHepU08IpyjZaLkjg8LIO81WO71OqAWiD/Fexv4rTTUGtBuTEvPnRLN1B83MXWyVkYrGM17eURBd6eGSmBPahV1+0gI7vNBprLMmBPcw+Ju4hxZ/jhi0CVEb1ExhdkkVarlfXP170Kt1psOktX7PiMBdeKpQJkNpGySiDc0=
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
Cc: Leo Li <sunpeng.li@amd.com>, Lewis Huang <Lewis.Huang@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpUaGUgdm0gY29u
ZmlnIHdpbGwgYmUgY2xlYXIgdG8gMCB3aGVuIHN5c3RlbSBlbnRlciBTNC4gSXQgd2lsbApjYXVz
ZSBodWJidWIgZGlkbid0IGtub3cgaG93IHRvIGZldGNoIGRhdGEgd2hlbiBzeXN0ZW0gcmVzdW1l
LgpUaGUgZmxpcCBhbHdheXMgcGVuZGluZyBiZWNhdXNlIGVhcmxpZXN0X2ludXNlX2FkZHJlc3Mg
YW5kCnJlcXVlc3RfYWRkcmVzcyBhcmUgZGlmZmVyZW50LgoKW0hvd10KUmVwcm9ncmFtIFZNIGNv
bmZpZyB3aGVuIHN5c3RlbSByZXN1bWUKClNpZ25lZC1vZmYtYnk6IExld2lzIEh1YW5nIDxMZXdp
cy5IdWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpB
Y2tlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlhbmcyQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kYy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IGY3YTNkNjUyYmU1
Zi4uNzQwOGRmMDVkM2U1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2Rj
LmMKQEAgLTIyNjIsNiArMjI2MiwxNCBAQCB2b2lkIGRjX3NldF9wb3dlcl9zdGF0ZSgKIAkJZGNf
cmVzb3VyY2Vfc3RhdGVfY29uc3RydWN0KGRjLCBkYy0+Y3VycmVudF9zdGF0ZSk7CiAKIAkJZGMt
Pmh3c3MuaW5pdF9odyhkYyk7CisKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzAKKwkJ
aWYgKGRjLT5od3NzLmluaXRfc3lzX2N0eCAhPSBOVUxMICYmCisJCQlkYy0+dm1fcGFfY29uZmln
LnZhbGlkKSB7CisJCQlkYy0+aHdzcy5pbml0X3N5c19jdHgoZGMtPmh3c2VxLCBkYywgJmRjLT52
bV9wYV9jb25maWcpOworCQl9CisjZW5kaWYKKwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlBU1NF
UlQoZGMtPmN1cnJlbnRfc3RhdGUtPnN0cmVhbV9jb3VudCA9PSAwKTsKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
