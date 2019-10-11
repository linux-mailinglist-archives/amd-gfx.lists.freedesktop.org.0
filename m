Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C1AD48B1
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30D16EC98;
	Fri, 11 Oct 2019 19:53:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800081.outbound.protection.outlook.com [40.107.80.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06C86EC99
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYLeWlTv5OA8kc/8ufkYm/JtTtcaLkUk4LOyz/GIHDzsH7UztYiQ8bihklj5ks5OJGSfU+QR2s7CPWdp1I1aZsXGhG9/lPiutBPnVAmKLmx1KMdnYKOdRcSklj2PY2Pzrl9uxN+fvmvGK9GBEJTpBzZUt45vHGdMvpDTBTYG5KRxj7YVL40deL0fHHWG6dbzI+1iqUOkoSF+yyfu9TawDopNjhV319fp3/LXBzH8I9EySuxePz7E6y8iStBqpwAheiYnGaLr8n41jcFfTalpOKo5+qO9Ks1UmK2As546aOAilVHo7cl4cuh5qu5zK9eg+j3UQCuRAZiK3qO/0DKC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xLfg14JFIAJfNKoSld4IFZ8TjXeKNwLduqr3XnDNcI=;
 b=iOpYQDn5lxat353fSeSrWHzJaSbaWyoQo1HGqC7C/hWNBYTVLg+UyNHIAyewLl1cFtmBXDwblnw/e8o/Imdn/0nMA+qB3Yt/qYw6bCq825eUyN3UpbneL5bHiQGFsW2Rn4n8AiY1HDxoBwbcez9D8/HJb+sBtrxMV9ptnkevFfdhkI+UAK2Nal+BAwjpnyZF11b6Wm8IFXWGB7ISD7Fkkkz8vSJ8A8Oj0eDPxHlyp6Fheu2CjriCNcJ+FeeqOh7i71l+bux4FqSISOPU7YUbH0I/DGHzT4lePXNehck4hNSKLH4TBtGRY688D3/jIs8gTlPf58R2xe2Sl1dKBt9XgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by BYAPR12MB2837.namprd12.prod.outlook.com (2603:10b6:a03:68::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 19:53:51 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:51 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:50 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/29] drm/amd/display: add detile buffer size for renoir
Date: Fri, 11 Oct 2019 15:53:11 -0400
Message-ID: <20191011195324.16268-17-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(428003)(189003)(199004)(316002)(16586007)(4744005)(70586007)(70206006)(305945005)(1076003)(2906002)(4326008)(5660300002)(36756003)(8676002)(81166006)(126002)(486006)(81156014)(478600001)(53416004)(47776003)(50466002)(50226002)(446003)(11346002)(2616005)(426003)(6666004)(476003)(48376002)(336012)(86362001)(76176011)(51416003)(7696005)(2351001)(8936002)(356004)(6916009)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2837; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c73439b2-5402-463b-0f7b-08d74e84bcf2
X-MS-TrafficTypeDiagnostic: BYAPR12MB2837:
X-Microsoft-Antispam-PRVS: <BYAPR12MB28371CAF070A3C076E6A1C9EF9970@BYAPR12MB2837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6dMbFgfFVjZQHQtUANso4T1ilJfE9G6C/kOtYDwCtA0U3uS9Er5YOIBmMksRsmsqp2ILF3ZPa8vM/ruHQ4kHoO6bTcMo5MNx1jwCJ7mkyqJLaEWl6WWa5+t4huF6EBH2ipOKfixJ94qpJCBuIavH0wBC5zUZNJcL91/bO/7GJ8BkNBJ3KzmPhdsDLzTyIc0tTqUNaldckk4bclLTPeU0uSPmIoOnpP2UenHTEA49eyHBsyZPZUY7LXNc275fQZ59C1zNe20kHL4+n4CEzD0EYC9x6IhLJ1NSpD7rQ+DpULm7NUdRufKh/TyGuTxTeuQUzbqAkYqGqkzHH9oQLnJaSrCpcZI3TbPy6TR413eQ0MujvZTXetxGbMAOMLvI3rt0tLPyG861MYq9Y0YyAwG1zlCuy0bfh2jCaWEOmnMOI5I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:50.7193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c73439b2-5402-463b-0f7b-08d74e84bcf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2837
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xLfg14JFIAJfNKoSld4IFZ8TjXeKNwLduqr3XnDNcI=;
 b=pjtK8CMkkh6IZxphM0weBzqICcVA8lkuaH7uHs1aIq72kvEQE4z0eEFBK3qIQeT4ACyhPQmhntblZOO1Yr00g6dkLLI3tU4U2F8pb2P6iiiomnAQX/0c8dAvMtDHB5D4Z/bYPsVO4rIg6oaSfQD/d4tByfeRoxHlvLMw/73KCfA=
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

RGV0aWxlIGJ1ZmZlciBzaXplIGFmZmVjdHMgZGNjIGNhcHMsIGl0IHdhcyBhbHJlYWR5IGFkZGVk
IGZvcgpkY24yLiBOb3cgYWRkIGl0IGZvciBkY24yMQoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJl
ZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2h1YmJ1Yi5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjEvZGNuMjFfaHViYnViLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjEvZGNuMjFfaHViYnViLmMKaW5kZXggYWViNWRlNmY0NTMwLi5mNTQ2MjYwYzE1Yjcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9o
dWJidWIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFf
aHViYnViLmMKQEAgLTY1Myw0ICs2NTMsNSBAQCB2b2lkIGh1YmJ1YjIxX2NvbnN0cnVjdChzdHJ1
Y3QgZGNuMjBfaHViYnViICpodWJidWIsCiAJaHViYnViLT5tYXNrcyA9IGh1YmJ1Yl9tYXNrOwog
CiAJaHViYnViLT5kZWJ1Z190ZXN0X2luZGV4X3BzdGF0ZSA9IDB4QjsKKwlodWJidWItPmRldGls
ZV9idWZfc2l6ZSA9IDE2NCAqIDEwMjQ7IC8qIDE2NEtCIGZvciBEQ04yLjAgKi8KIH0KLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
