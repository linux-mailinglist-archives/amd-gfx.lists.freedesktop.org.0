Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F7D3E04
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 13:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B541D6EC14;
	Fri, 11 Oct 2019 11:10:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AEA6EC14
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 11:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by7VCpPDXjy23nqcY8Vkwe8Dfp29haZZmsPoNp/hedGQKAyIUmdc+sGqXg9rudVqyM662EMNmJprveBVsEpdnIC0SsB29G9eaRMCICpOtK4OthUUshKcVi22QM1UvueLdxg7sqGTW3ozMGHjZxtAKUH8CqYcHxQPhAqEXayO4s3H26s8YvRfgPcdI5NdW4OtVz3XN9WUHWIlnNu8eQdTgunR1esMaksfxBx2rK0M9eLyUCEBkaRtMWuyBoD5te0wKgx6rDVvHwjIpM7TZukyTxrSW20qD8PnDWgOFz33cDlPzuKJBvOt3T/951hf4Qqdklc6jjKk1tZIB0rNJgYMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KASZf/vK+FUxRewh6/HgLT8+9wmij+qp7Y1AfBD+krA=;
 b=mMfnlYkjR7QIxtoU10KIS54Gxhw5KE01S3yRM1Ptf61rSkhxhg/0qehrmZZI7BD4JYH5Y2r/II+ELMaXc6918BseIhqkgA68nP9lakdOrZoOrxcOvo2wllVVYVVTqwjGGlpN4ttzcV9z9d9rE9++eztaAfF45w2RqjkC4l+becQ8CJsMl4Sbl2348tg1Lj8dKqVpIDJf4tu7YYlNyFVzgNI1BH4Qcr5BRzb8PyrOPv7EEZtJ0lhdChK7jVg1+PRa+aEG4GXI12RI1CCiMRC1FBeaAa9ruL1muVtPdr9DsruFjv3PFisrsUlTnY3ZtN/h3StN44mBG+y9LY9LwZwF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 BN6PR12MB1795.namprd12.prod.outlook.com (2603:10b6:404:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Fri, 11 Oct
 2019 11:10:38 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 11:10:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 11:10:38 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 11 Oct 2019 06:10:35 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amd/powerplay: add BACO platformCaps for VEGA20
Date: Fri, 11 Oct 2019 19:10:28 +0800
Message-ID: <1570792228-11189-4-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570792228-11189-1-git-send-email-le.ma@amd.com>
References: <1570792228-11189-1-git-send-email-le.ma@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(428003)(189003)(199004)(36756003)(2906002)(86362001)(11346002)(2616005)(16586007)(44832011)(48376002)(316002)(446003)(126002)(486006)(476003)(305945005)(6916009)(2351001)(4326008)(47776003)(8676002)(8936002)(50466002)(81156014)(50226002)(5660300002)(51416003)(70206006)(70586007)(478600001)(356004)(6666004)(4744005)(81166006)(76176011)(336012)(186003)(426003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1795; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b152f07d-93fd-4234-f2e1-08d74e3ba599
X-MS-TrafficTypeDiagnostic: BN6PR12MB1795:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1795E70E059FB028232D11B1F6970@BN6PR12MB1795.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohs7Z61nqHdbS4CkrDAFQjVqC2LNP2mq0E9YXirVCt0Md36dqpf/QZn1twe7ZSGV3/WFr40fW9ra6jpt6fZ3b5ONaupf2IYYnhq8PSAk1l92wankEUcyHibldou31W2VQ3Id5txhuvYSy65FGzXmeKb0Z+Zv7AE6G9EMpporNInB7fNzuUbc0A6WasbV/SICfksHfOj6/GM7qeTIxs3Z1FvrUqPhS8b2iyyGhnqi3I2PYgh/VumQeJm/J1OEoTSVwmIaEPY8e8JSZoPItggsQCkZRlyJibpT51YyioTSHzqE0d3C1uaaXz+r+K9aJatbQdOzCPUvKCxlSyd7ATVLdno7dqUaU8N0tL1PKqGlW0YIy5150Fm+hlUunLYUfWhlQJUNVyPiEzOIXcUwK2cVGN0Qe1h/hdj4Nq9A9cCNqqM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 11:10:38.2990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b152f07d-93fd-4234-f2e1-08d74e3ba599
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1795
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KASZf/vK+FUxRewh6/HgLT8+9wmij+qp7Y1AfBD+krA=;
 b=RRqkRTMRSX00ZumvRKfgLAQJZB8meYWi3wAsKjVEU8k9wsri0Ar3GqpX6KAk1CaYlQi8NRe858sOB57x0cqgF7+poZUK5RpK7CAytLtponPfw3sQsYrwfvT/aSfXA6zXx6X9bDREpNz4hEQU0SBRwPMVSwIoK+7BgxFhgxbtEhE=
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
Cc: Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QkFDTyByZXNldCBpcyBuZWVkZWQgZm9yIFJBUyByZWNvdmVyeS4KCkNoYW5nZS1JZDogSTgyMDdm
YzMxNDc0NDQ2OGM4OWJhNGEwMzBjYjJiYjE1YjA4MmFhYzcKU2lnbmVkLW9mZi1ieTogTGUgTWEg
PGxlLm1hQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
dmVnYTIwX2h3bWdyLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9o
d21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdy
LmMKaW5kZXggNjYyOWM0NzUuLjNkM2M2NDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCkBAIC0xODMsNiArMTgzLDkgQEAgc3Rh
dGljIGludCB2ZWdhMjBfc2V0X2ZlYXR1cmVzX3BsYXRmb3JtX2NhcHMoc3RydWN0IHBwX2h3bWdy
ICpod21ncikKIAkJCVBITV9QbGF0Zm9ybUNhcHNfVGFibGVsZXNzSGFyZHdhcmVJbnRlcmZhY2Up
OwogCiAJcGhtX2NhcF9zZXQoaHdtZ3ItPnBsYXRmb3JtX2Rlc2NyaXB0b3IucGxhdGZvcm1DYXBz
LAorCQkJUEhNX1BsYXRmb3JtQ2Fwc19CQUNPKTsKKworCXBobV9jYXBfc2V0KGh3bWdyLT5wbGF0
Zm9ybV9kZXNjcmlwdG9yLnBsYXRmb3JtQ2FwcywKIAkJCVBITV9QbGF0Zm9ybUNhcHNfRW5hYmxl
U01VN1RoZXJtYWxNYW5hZ2VtZW50KTsKIAogCWlmIChhZGV2LT5wZ19mbGFncyAmIEFNRF9QR19T
VVBQT1JUX1VWRCkKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
