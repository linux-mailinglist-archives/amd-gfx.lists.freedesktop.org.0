Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7C7D5E2
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A8A6E39C;
	Thu,  1 Aug 2019 06:54:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720067.outbound.protection.outlook.com [40.107.72.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C736E39B
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2CPZvIMaYU/0VyEVmXwcnxXuTZpkp+9uBjzftAT7+7Uj+YBVuKmOvlJnrwN4pgHjGqHD3J7khS4q6EOVMCiX2p/NA4rWUZ2WS7B8EG3CC4XW+PE2vHihGEABK7p9jigt2Oi5NfrlQ/8qOSQt7dwyBZHGMQPMOVRP97hx+54L4PjMHHe0IuXcohMQk/cn3UfM07HbmlN9f3c6qA9kSkUXvZ2+SwPAcTOB3Cegla470AyWK1krXVJ9Jr1q2c1H0OZa9VR4AVZ2757FxoK1smFR4oQnnDqEbI6rQA7YyJNJRE4tYIdjyJYISGVax/kO8Uin9KKq1yi6ZQB2CNSrDoKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1Jhbfe1GbSdH+3QIE6PWHrbG/Gbs9GQTPrucfwjvPM=;
 b=bxE/kkhFP3MTQyYkgeAlvyU0LZIEE8re9USJws/1nN1mslKjD5x7IWye72zD0iPUdpdfH4FDHMQDGfJJpptPrgCex75YCaV6Sr/IgqnjzbTWBOCRllozk29aDK1Wkpvwb8eMgBecxtQrt2/pllZMNqnIBwJ98hfZReTSrYMRoKG4Txry4WL7RM32ZmhG+ojiqXsRHKkN9MEaw9NKigRswr5bpSKtFEx+1PEG/6Y5xPcmpgczfKVq9PK+ik2KGJlNgKMRGnl5zZ0a8AY0qPwkY/gG62LcbtUZH03bVRrOK1t61tjNIaNcqNemy8SycFprPjYYiPrLrKhgnx/F07qJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0046.namprd12.prod.outlook.com (2603:10b6:802:20::17)
 by MN2PR12MB3518.namprd12.prod.outlook.com (2603:10b6:208:101::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14; Thu, 1 Aug
 2019 06:54:13 +0000
Received: from BY2NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by SN1PR12CA0046.outlook.office365.com
 (2603:10b6:802:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Thu, 1 Aug 2019 06:54:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT013.mail.protection.outlook.com (10.152.84.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:54:12 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:54:09 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 0/4] enable umc ras ce interrupt
Date: Thu, 1 Aug 2019 14:53:38 +0800
Message-ID: <20190801065342.8450-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(2980300002)(428003)(189003)(199004)(81166006)(186003)(81156014)(68736007)(70586007)(6636002)(50466002)(356004)(8676002)(50226002)(86362001)(48376002)(478600001)(6666004)(8936002)(5660300002)(426003)(51416003)(7696005)(336012)(4326008)(2906002)(4744005)(2201001)(47776003)(36756003)(53936002)(486006)(110136005)(305945005)(14444005)(2616005)(16586007)(476003)(26005)(316002)(126002)(70206006)(1076003)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3518; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 172e0685-2b0d-44c2-fba2-08d7164d0fed
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3518; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB351890A0DC7D29D4926F428DB0DE0@MN2PR12MB3518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QCtXbm7IT3m8VRSzSE25j3S72Amd/B0vhu5Ch23IclOO77WcTBiAXrpmTEnbIP1nuXuYAaP6rSq/YyYSjXZdx/sbRoPRGDkq2HyfxEhp9FAjQsuqe5mjYqT8eqLn4nJeabFPmHDdHHx2H9WeFbamsL6WrWIySpegw8XILWq4p0zCnYRWSG51eYfBFcBz10qgDo57uXBXzKI3ESv6W6hkPjhb5uUQfzJY3JrUUO/3QgeZdyyiXVScJ16qnU5vZygBDa+Tv4gf9mLfNnHITYE3fIJ8t1VVG1FDN0c2qC8zHPA8rPJPWrzF2q+bkGnRtKfL4BbCsWC1vaafSlY9KcdB/uIKEMbr/L9WiC6Rbn9k3ah3GbMueVvsL3Cd6M6OcJ4YTwq29+8E/s7m/M7jRDzjRSGHanvdasl+/7Zzr8zigRw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:54:12.9118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 172e0685-2b0d-44c2-fba2-08d7164d0fed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1Jhbfe1GbSdH+3QIE6PWHrbG/Gbs9GQTPrucfwjvPM=;
 b=wUY6AB5azN27uUaK2rpGQf6CVWYxewU+AUEbsPkR4PcBnWtYLfx7r+D8pwcgDqP9xhpTxTkSQN+XnRsjkuWzV3nTXUFPKDY2iPqNciMqiY8qbxNd3hg8g67pbADe7WtrPXdMrhAP4U5oEcwvMv8WWK7PK3nHkoCu91Adk3bgvdU=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBhZGQgc3VwcG9ydCBmb3IgdW1jIGNlIGludGVycnVwdCwgdGhlIGludGVy
cnVwdCBpcwpjb250cm9sbGVkIGJ5IGEgZXJyb3IgY291bnQgdGhyZXNob2xkLgoKVGFvIFpob3Ug
KDQpOgogIGRybS9hbWRncHU6IHN1cHBvcnQgY2UgaW50ZXJydXB0IGluIHJhcyBtb2R1bGUKICBk
cm0vYW1kZ3B1OiBpbXBsZW1lbnQgdW1jIHJhcyBpbml0IGZ1bmN0aW9uCiAgZHJtL2FtZGdwdTog
dXBkYXRlIHRoZSBjYWxjIGFsZ29yaXRobSBvZiB1bWMgZWNjIGVycm9yIGNvdW50CiAgZHJtL2Ft
ZGdwdTogb25seSB1bmNvcnJlY3RhYmxlIGVycm9yIG5lZWRzIGdwdSByZXNldAoKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDEyICsrKystLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8ICA2ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDQyICsrKysrKysrKysrKysrKysrKysrKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmggICB8ICA3ICsrKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
