Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C0DB72B
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4D56EA3D;
	Thu, 17 Oct 2019 19:15:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730073.outbound.protection.outlook.com [40.107.73.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6256EA35
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjGgg65dA4NEQj+jkZBQ890WeQkYpwqKht5cIU23cH38VlB/YwnbAzChrbjGpeogIJnQsao7KBowMl39KVY3gImHLiDBzjh189ga5hOxOwWQZgefNInYciNUG1nWrvRdmi2uoRiw1/SDBoOv1OoZwqMHr7D4PbvcmvoGd0sRvzROKSIOKkBEReZ6bh39fbkxIFbx9Y96A+df/Byjz7zW6NdI5Rc7877ZWqXznT+ybg2sqSmYjt7MYHOFBMElZKQTFa2/3FTuVxtc/ZlSUOKQ0nRVhzmKLjO3ssIvTvihtZiGWQj8kx55Mc6amJatAXCT/Ggcy98Ew0ucbYefeZJ1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h03divWJ6ZMNDuESjz1SSLUtH2qrD51NsIwQSFw8SU=;
 b=d1pTlkfn5ZaRJ749LeCd8p7+Cg55LlP7no31LmqlxnLlky81GXeNehOxVYNGKDzE+2jyckZ36dYqOxf/QJHy6q1crnDGZHVb8A8wh7yxIM7rsbB7Ivsk+1TzprENO9KaFT6CaF4M1xs73x9Y7YVXRP7+aDp1oaUVIFFvxHMj+fz5prx7ZlrTny0Na4WGEkG7U6JH0QEj2GnDMAxPEecm0AHTlWUtj/DdTruDSK3gPjkTyVwYX3EKNeIJAbJ8cXHfOtzuixjSrvxflZUUp4gTsJBINxKzy+kVhoWl35dHIxUKT8/vUPHzkF8626JUriG9yB6bHWx73VJnvZT3bKUGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0063.namprd12.prod.outlook.com (2603:10b6:3:103::25)
 by CY4PR1201MB0229.namprd12.prod.outlook.com (2603:10b6:910:1d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:33 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0063.outlook.office365.com
 (2603:10b6:3:103::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:33 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:32 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:31 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/37] drm/amd/display: Remove superfluous assert
Date: Thu, 17 Oct 2019 15:12:57 -0400
Message-ID: <20191017191329.11857-6-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(428003)(189003)(199004)(305945005)(81166006)(76176011)(81156014)(26005)(54906003)(2870700001)(4326008)(186003)(70586007)(70206006)(2906002)(36756003)(316002)(51416003)(6666004)(8676002)(356004)(47776003)(86362001)(476003)(126002)(2616005)(426003)(2351001)(486006)(50226002)(446003)(11346002)(6916009)(8936002)(1076003)(4744005)(48376002)(478600001)(5660300002)(50466002)(2876002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0229; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5663a99f-d604-4d4b-e0e2-08d7533661e2
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0229:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0229EEB78247FE9F1605A90C826D0@CY4PR1201MB0229.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll2u6RkAaBudal3LasHIlAk/br2wg3ONs5PjsWEnN1FVePtm+TLC6IiguokvKV+Ziab7BGWqYqCcapEylSPwUY663xi6lndPgUe+vIKTNP/nJZb+j4DFmwR0jM2DkfAKBPdtWOfubndshCKkH23WMF35r87DDWJFxX6WjtqxjKW96+DxrW6rQzFjI3ktm+xkoprD3EfWj1U9TpqpYt4ujo356zq5uwMXtlZGXdiCpTzNmSBLdGkenpAUJ6qG8qJTzgwf1NIyqprDATL52ozOXce6jPOSFTNeDOjZ57Gp1AzYXeg1tDiaNeZD9ccCKnkBzvPYPsvQCllDGgLI6EHiU0yNukvdky5K8SWE7sCY+VC+5Rvvr3Gg+WO34nfTZusDAvPGZL33lf5xro547oMyfuG385wyjyEDa7xrwdN/BTI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:33.0164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5663a99f-d604-4d4b-e0e2-08d7533661e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h03divWJ6ZMNDuESjz1SSLUtH2qrD51NsIwQSFw8SU=;
 b=aIdnv9yJs12BaXDcBAUfNS33Verezi+mrw3h8kCcB2z9j7qW4EXckGAOnN58+Bt+pjgT2hMLyAPGrGG/gTDkIF6algvUINUu5wc9zZi0M5FVx4TCz83CPYeXD0txyXpHbcEyM/8IsYuW8/J5lnu5YuJIo9Qcij+uicrKXlCIU80=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jordan Lazare <Jordan.Lazare@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9yZGFuIExhemFyZSA8Sm9yZGFuLkxhemFyZUBhbWQuY29tPgoKW1doeV0KRm9yIGxv
b3AgYmVsb3cgdGhlIGFzc2VydCBhbHJlYWR5IGNoZWNrcyBmb3IgdGhlIG51bWJlciBvZiBpbnN0
YW5jZXMgdG8KY3JlYXRlLiBBU1NFUlQgaXMgbWVhbmluZ2xlc3MgYW5kIGNhdXNpbmcgc3BhbS4K
CltIb3ddCmRkCgpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gTGF6YXJlIDxKb3JkYW4uTGF6YXJlQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8SGFycnkuV2VudGxhbmRAYW1kLmNv
bT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgMiAtLQogMSBmaWxl
IGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBlZTkxNTdiNjczYWIuLmM5
NzkyYzQ3OTc4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTI5MTMsOCArMjkxMyw2IEBAIGJvb2wgZGNuMjBf
ZHdiY19jcmVhdGUoc3RydWN0IGRjX2NvbnRleHQgKmN0eCwgc3RydWN0IHJlc291cmNlX3Bvb2wg
KnBvb2wpCiAJaW50IGk7CiAJdWludDMyX3QgcGlwZV9jb3VudCA9IHBvb2wtPnJlc19jYXAtPm51
bV9kd2I7CiAKLQlBU1NFUlQocGlwZV9jb3VudCA+IDApOwotCiAJZm9yIChpID0gMDsgaSA8IHBp
cGVfY291bnQ7IGkrKykgewogCQlzdHJ1Y3QgZGNuMjBfZHdiYyAqZHdiYzIwID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IGRjbjIwX2R3YmMpLAogCQkJCQkJICAgIEdGUF9LRVJORUwpOwotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
