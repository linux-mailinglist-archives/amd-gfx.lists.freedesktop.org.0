Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 894FFC9085
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704096E1A8;
	Wed,  2 Oct 2019 18:16:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690056.outbound.protection.outlook.com [40.107.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B2F6E19B
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8TYELfkWba9AbNLUDyJhogFYh93/NjPO4PCKgAQxnLEq/ue5NCd0nbymeT2BXrv/V4dvvfo/9y8n8HKafQhnxXhrhX5sIyGYMwp/AoccKrUPyvLT0k9A7HROxAPzaZWYzK1vms07HpI3aPNRmt5uyHRAxEbe/K1Hn7jZu+j5eStOCvdjwlItsQ3K9DTVnRNJ+ZBmX9cwtf1VtqxZhhbWttms2Cwl/w5/qhDk05M+gKoz19qU3UAWSMD3KLE28aUblD8Iif5dm5F+41zITNm9eC+gRScbMRU55iWV8zxFNIrurVyWResFtPOhN/kg17AaUKYSl18jVDTeD7YctecKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ff4f9uBBg3Xu8xG59NKORshObDCrJ/IpwoJMQ5FfgLQ=;
 b=VlTeBlkHCunnXqnHmMiZppKlyYtNJ69qntRe+Nzlz9THn8J4RQb2pObzScegptCZ46LLnvHnoWynq13sOfeEJUKge68pCDEe3JcQy5DTN5bJbYFZ2mN9Y3XSY3gHdXNcPgUb/56lZuIVZq5XDQW+vmR7HI+FrloVAY0qNjQi6ykIMM57RYziJXli2JzD14yCfC5eQHTNFPptizfavfHpG/oDAPtR4Ib/7OhwOXWT+7G7VQHYIx+p29h9dLZ2PEsWzyMp9yJi1hutP+nqOOhYs1obEY5o6jGdlsJIMM0mM9iE/2kWhqIKQbTGLAKnqBPKaMNZok+Jnd+jDhZSGGG8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:1c7::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.16; Wed, 2 Oct 2019 18:16:41 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:41 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:39 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/38] drm/amd/display: build up VSIF infopacket
Date: Wed, 2 Oct 2019 14:16:08 -0400
Message-ID: <20191002181633.22805-14-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(428003)(189003)(199004)(7696005)(51416003)(8676002)(48376002)(81156014)(6916009)(81166006)(76176011)(36756003)(336012)(1076003)(4326008)(126002)(86362001)(426003)(47776003)(486006)(446003)(11346002)(2616005)(476003)(50226002)(2906002)(356004)(6666004)(53416004)(16586007)(14444005)(70586007)(70206006)(478600001)(186003)(8936002)(50466002)(26005)(5660300002)(305945005)(316002)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3834; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7cd1dd5-9d5e-4c5d-e792-08d74764acc9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3834:
X-Microsoft-Antispam-PRVS: <DM6PR12MB38345657EBC95A0D8118815EF99C0@DM6PR12MB3834.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwan2yVy/6kq6XpEI3ZaQeyCar4lLfTljoxHkAE6ulH2m/m309IoFbdqT8XzTUSITAxE2b/RVRJVVFHvpY9t29nsuimh+gQUiyyKogqrd1gKUjl6JB/Yw6DcvabxrJa2YhLhqQvzBtSOYOTXGAEyQ0bdEc6ZF6HSODeCk380+adM8timg1J6Dn7gT8PwEbjX4oEoiTaMeUemmDvAWoVrTphQbIPUlF/02ltoPiGGUHvhV5jM/S6DNroqR8kcNaLDC6jAcyNtu72QEFzDUeO0Md3uw46bGL5P8F3ohSVsS5+Rmxo+rosJFimLZ9UfxAA7QrBfdFTLkSP2TCfge1mBmGzBfuH8xURjnXXcRjTTY8qN9mxfebEoCYvQuyGtikTooFw55c/LzqajEWGB9Qg81+y37uADu1qLIoj7L3vRQNU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:41.5918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cd1dd5-9d5e-4c5d-e792-08d74764acc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3834
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ff4f9uBBg3Xu8xG59NKORshObDCrJ/IpwoJMQ5FfgLQ=;
 b=gKlquenrmhFDrQ0NVFQLACSn/CQapMhu/CqbbdxqVTOMHAzvGqaiaUQGgM59WoXz3MCQYGae8bXA9oHPm/yU1KRzq/wRvRC/o2oKAQMA8G7/NBXmlBEkUns1FUj/LboBpqTfmO6+D7CPXMk2BvW+MI0SF3OmSYSusYWio42O0Fc=
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KCltXaHldCkRpZG4ndCBzZW5kIFZT
SUYgaW5mb3BhY2tldCB3aGVuIGl0J3MgNGsgbW9kZSBkZWZpbmVkIGluIEhETUkgMS40Yi4KRm9y
IEhETUkgMS40YiwgV2hpbGUgZGlzcGxheWluZyA0ayBtb2RlcywgaXQgc2hvdWxkIHNlbmQgVlNQ
LgoKW0hvd10KQ2FsbCBtb2RfYnVpbGRfaGZfdnNpZl9pbmZvcGFja2V0KCkgZnVuY3Rpb24gdG8g
YnVpbGQgaW5mbyBmcmFtZQphbmQgc2VuZCBpdC4KCkNoYW5nZS1JZDogSTFmYjdkNmQ3NDk3MGI0
YTUwYjU3MzQ2Njk4NjYyY2JjOGIxOWQwZTQKU2lnbmVkLW9mZi1ieTogV2F5bmUgTGluIDxXYXlu
ZS5MaW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPE5pY2hvbGFz
LkthemxhdXNrYXNAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5w
cmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCmluZGV4IGFkMzlkYzUyYWE5OC4uZGQyOTY0YTkxZTE3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTM4MDgsNiArMzgw
OCw5IEBAIGNyZWF0ZV9zdHJlYW1fZm9yX3Npbmsoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3Ig
KmFjb25uZWN0b3IsCiAKIAl1cGRhdGVfc3RyZWFtX3NpZ25hbChzdHJlYW0sIHNpbmspOwogCisJ
aWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9UWVBFX0hETUlfVFlQRV9BKQorCQltb2RfYnVp
bGRfaGZfdnNpZl9pbmZvcGFja2V0KHN0cmVhbSwgJnN0cmVhbS0+dnNwX2luZm9wYWNrZXQsIGZh
bHNlLCBmYWxzZSk7CisKIGZpbmlzaDoKIAlkY19zaW5rX3JlbGVhc2Uoc2luayk7CiAKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
