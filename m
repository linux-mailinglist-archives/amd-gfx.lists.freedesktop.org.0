Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2281FB75
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60197891CA;
	Wed, 15 May 2019 20:24:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720075.outbound.protection.outlook.com [40.107.72.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA30889193
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:24:26 +0000 (UTC)
Received: from SN1PR12CA0089.namprd12.prod.outlook.com (2603:10b6:802:21::24)
 by BN6PR1201MB0052.namprd12.prod.outlook.com (2603:10b6:405:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.20; Wed, 15 May
 2019 20:24:24 +0000
Received: from BY2NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by SN1PR12CA0089.outlook.office365.com
 (2603:10b6:802:21::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Wed, 15 May 2019 20:24:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT024.mail.protection.outlook.com (10.152.84.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Wed, 15 May 2019 20:24:24 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 15 May 2019
 15:24:22 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/amdgpu: Fix maybe-uninitialized warning in
 df_v3_6_pmc_start
Date: Wed, 15 May 2019 16:24:13 -0400
Message-ID: <20190515202413.6522-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190515202413.6522-1-Bhawanpreet.Lakha@amd.com>
References: <20190515202413.6522-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(70586007)(486006)(126002)(2906002)(316002)(4744005)(476003)(478600001)(6916009)(2616005)(11346002)(5660300002)(446003)(7696005)(36756003)(50466002)(1076003)(47776003)(81166006)(86362001)(76176011)(81156014)(72206003)(8936002)(426003)(6666004)(356004)(8676002)(53416004)(5820100001)(2870700001)(336012)(50226002)(4326008)(14444005)(70206006)(53936002)(77096007)(2351001)(305945005)(186003)(23676004)(26005)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0052; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4710f096-7e39-439e-59a4-08d6d9735243
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:BN6PR1201MB0052; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0052:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0052C5D6BC2251042C4701AEF9090@BN6PR1201MB0052.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0038DE95A2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qkjis7yhGS8/ipLySGB2eByMq8UKvqcZ69nVOW5tbf0dNzkWE6tBk4bplBRXV6YRgl8782jX9V/qD6AkBld5zNd8GGAK6bQsK3Bo/u2j34k2ixNERohrcZu6RAT8mKxMWBXiOYFxcGFUfpkGsQ6F51xbBEJdcgHXGakYMPNm3JQFJDmYE1W1/w9r2FET2O8KXcP9dQm91vnqRl8wTX3Xb1aq+LLzbkFviGvwyFnLncgj5yyn0pIRtrO2MGEn/VoxHhg1/tHMYhHHQc37Ye5/6XK+5j9sXTpaCAo5brqXoWO7HVLtjkFZbMhC6U4qf9ZUxcpJScA9Raf5KnADBfSVNIeJ5lBfU+KeO9Uf7AfZPqMpT3qJWkHS8gOH5pNuW+1ZdXFAGRUKFqFJlgn2xU17CcBDpBROzpJfcqhu5h9rLkw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2019 20:24:24.2534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4710f096-7e39-439e-59a4-08d6d9735243
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0052
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvaHlwvT6Og1vKPXo816ckWbYVcRcNQpTy8Qx9S34wc=;
 b=ZJMNJzN9WWfBjeAApg/Q5A9/tMHHH5yba6JUoTGFoKhrROVbC7fRx6xqUn6fGVRmTQMOQjKLxbblObavzS8mfT0gICihfXe+OvMTGoo87NqArVgC/hbjbpKkEJH9gotdfSNzezeNk46/uAF75lzTfMww7YV8Rq/lc1E3e0wXP3c=
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

VGhpcyBmaXhlcyB0aGUgd2FybmluZyBiZWxvdwoKZXJyb3I6IOKAmHJldOKAmSBtYXkgYmUgdXNl
ZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFs
aXplZF0KICBpbnQgeGdtaV90eF9saW5rLCByZXQ7CiAgICAgICAgICAgICAgICAgICAgXn5+ClNp
Z25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2RmX3YzXzYuYwppbmRleCAyMDFjMDA0MTE3MjAuLmE4NDQyNTA4ZWVhNSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwpAQCAtNDU5LDcgKzQ1OSw3IEBAIHN0YXRpYyBp
bnQgZGZfdjNfNl9zdG9wX3hnbWlfbGlua19jbnRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAogc3RhdGljIGludCBkZl92M182X3BtY19zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdWludDY0X3QgY29uZmlnLAogCQkJICAgICBpbnQgaXNfZW5hYmxlKQogewotCWludCB4Z21p
X3R4X2xpbmssIHJldDsKKwlpbnQgeGdtaV90eF9saW5rLCByZXQgPSAwOwogCiAJc3dpdGNoIChh
ZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfVkVHQTIwOgotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
