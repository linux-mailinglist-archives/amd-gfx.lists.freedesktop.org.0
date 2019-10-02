Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D7C909B
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A168E6E97F;
	Wed,  2 Oct 2019 18:16:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730070.outbound.protection.outlook.com [40.107.73.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC5B6E96B
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaNUQmsLP9NMWUO1o46XMCX9c0i1AuIHVkfjOS+D3QcrrP+sUfSfbc902Al/f7AMk/Tq2ptTZsXFxRcX7luPf97xKLoqZsPYTFIrZ7QFWyzvLDb7Hq9e+/gEY07579hmxyzHXowBMaJ9BBsgIqusHmUu9dG5TFVJAOJL3IU8n/eUQbxQq95omcvf/tdPKigyDB4/JWyo+r3m1+PdWKVWpMSzEShsA8vmLnh1N6aDlayLzelvry5v/hRSDt+yMwkB2Aa0pWZ5d4Gq1ZBbF17ugx32SR97x1krSxXkWnrk3iWHuGM2sVb3IQaj6lr8+WE27K2cSyl/DsXtcmRdKC7Peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1ofxdUHsXzyR4Kd/k2nyd8Gde79bQreOJjJ8TNC8UU=;
 b=ZUZN+ZLL+fdQLJ27VA/zErAFOcHhqsRfxpjQFhHtrUq3rsiUHL1qEAmJNfjmFpX/BEsy2GnfuZkGauTHcurNgZxQGdAPa5oW0GypHE0nRBOTlx3g6J2R5cbqgaCelJxn8t0uL2Zb2CdaQ57hBcdDHjCKqOnlpiDuxBUZ9HhjqVQ+i+cWin2Uqba9pdEh6Y4i3ZiDnXGFo/+qG2VibBPyWYAm1tP9lauH0tNcEpR9YKPWUqHqdBatxMjAS5AnLxPG0o2wz1yXwhgruWzGOWhsTqt0oAx9w/oD0drFiwxZ8RR88HBuG5iagfPf+pOQvptMUpx8LfxNqH8U/NU4Myg3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0027.namprd12.prod.outlook.com (2603:10b6:208:a8::40)
 by MN2PR12MB3631.namprd12.prod.outlook.com (2603:10b6:208:c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:50 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by MN2PR12CA0027.outlook.office365.com
 (2603:10b6:208:a8::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:50 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 31/38] drm/amd/display: make aux defer delay and aux sw start
 delay seperate
Date: Wed, 2 Oct 2019 14:16:26 -0400
Message-ID: <20191002181633.22805-32-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(428003)(189003)(199004)(356004)(70586007)(6666004)(70206006)(2351001)(4326008)(81166006)(81156014)(8676002)(50226002)(53416004)(86362001)(305945005)(316002)(2906002)(36756003)(1076003)(186003)(11346002)(26005)(486006)(478600001)(76176011)(5660300002)(48376002)(476003)(51416003)(7696005)(2616005)(126002)(426003)(336012)(50466002)(47776003)(16586007)(6916009)(446003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3631; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba3f8ca7-0ac1-4268-de03-08d74764b1db
X-MS-TrafficTypeDiagnostic: MN2PR12MB3631:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36310483B3EC14EB4BD59198F99C0@MN2PR12MB3631.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8nvQSBjI4pvNOmiwyAuJiXqhhCvvnzmdsdpHBC/X/8QEqD5dfAvJbGVITZq2vjW67MHOaFRPT4Cl5Y2nbzwUmq5iCIF5YgODb4OyB7eFKuWUF0YKoFC9IxpQMP8aeorJllm0U8m1mJ/KIk6dHuQZqwJwq/hbwI9ZKCTkiKMNtCStbnJSa1XjA05FJDHXPhFtoNAD9IoDjCxTIsjWKxBFIO49lObMTGsAQg+SjEIsqEzEeaAKYzSzVkhLbD1tE2xjsw72V4FbSnlnBixOKDywzs8V3/OXR15w9iBLXePuVnWasrig6pPJD04zYkAH5UILm1h+CDh6tUkYmmSp8BR/ZKHFAb4eK3TBc2eiOVR/pOzz2X/SXR5WL/kgMyUqgeKKzRQAtPrbvR2lL8ToOsjTxnqTM6vf1okCS8+pzkaJ8w=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:50.1561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3f8ca7-0ac1-4268-de03-08d74764b1db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3631
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1ofxdUHsXzyR4Kd/k2nyd8Gde79bQreOJjJ8TNC8UU=;
 b=arpII7gqs5T0SJFmb2jJKkm81OoeuzwrNFhLdO8VUu7O4FGoh6WSdweAyLhziJJJHNS6YHJag4SFUiFsGkLa8FYM98E4xHY3bZJgFiGmBBjQFybrOixtbqI1lQeNFbdwBOXum0qdt895zHlVpNe0tZ1FCST7poHhuX3EvlM1lLg=
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
Cc: Xiaodong Yan <Xiaodong.Yan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2RvbmcgWWFuIDxYaWFvZG9uZy5ZYW5AYW1kLmNvbT4KClt3aHldCjEuIGRlZmVy
IGRlbGF5IGFuZCBzdyBzdGFydCBkZWxheSBoYXMgYmVlbiBtaXhlZCB1cCwgZGVmZXIgZGVsYXkg
d2FzCnByb2dyYW1tZWQgdG8gQVVYX1NXX0NPTlRST0w6QVVYX1NXX1NUQVJUX0RFTEFZLgoyLiBU
aGVyZSdzIG5vIGRlbGF5IGZvciBkZWZlcgoKW2hvd10KMS4gU2V0ICBhdXggc3cgc3RhcnQgdG8g
MAoyLiBBZGQgZGVsYXkgZm9yIGRlZmVyIHNjZW5hcmlvCgpDaGFuZ2UtSWQ6IEliYzQ3MGI5OTk4
MGU0NzQ2MDRmZTg4NDc1OGI1YmYwNDkzMjVlYWIwClNpZ25lZC1vZmYtYnk6IFhpYW9kb25nIFlh
biA8WGlhb2RvbmcuWWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNo
ZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFr
aGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9h
dXguYyB8IDExICsrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UvZGNlX2F1eC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
YXV4LmMKaW5kZXggYzNmOWY0MTg1Y2U4Li40OGEwZTRhZTgwYzIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jCkBAIC00NzUsNyArNDc1LDcgQEAgaW50
IGRjZV9hdXhfdHJhbnNmZXJfcmF3KHN0cnVjdCBkZGNfc2VydmljZSAqZGRjLAogCWF1eF9yZXEu
YWN0aW9uID0gaTJjYXV4X2FjdGlvbl9mcm9tX3BheWxvYWQocGF5bG9hZCk7CiAKIAlhdXhfcmVx
LmFkZHJlc3MgPSBwYXlsb2FkLT5hZGRyZXNzOwotCWF1eF9yZXEuZGVsYXkgPSBwYXlsb2FkLT5k
ZWZlcl9kZWxheSAqIDEwOworCWF1eF9yZXEuZGVsYXkgPSAwOwogCWF1eF9yZXEubGVuZ3RoID0g
cGF5bG9hZC0+bGVuZ3RoOwogCWF1eF9yZXEuZGF0YSA9IHBheWxvYWQtPmRhdGE7CiAKQEAgLTU0
NCw4ICs1NDQsMTUgQEAgYm9vbCBkY2VfYXV4X3RyYW5zZmVyX3dpdGhfcmV0cmllcyhzdHJ1Y3Qg
ZGRjX3NlcnZpY2UgKmRkYywKIAkJCWNhc2UgQVVYX1RSQU5TQUNUSU9OX1JFUExZX0FVWF9ERUZF
UjoKIAkJCWNhc2UgQVVYX1RSQU5TQUNUSU9OX1JFUExZX0kyQ19PVkVSX0FVWF9OQUNLOgogCQkJ
Y2FzZSBBVVhfVFJBTlNBQ1RJT05fUkVQTFlfSTJDX09WRVJfQVVYX0RFRkVSOgotCQkJCWlmICgr
K2F1eF9kZWZlcl9yZXRyaWVzID49IEFVWF9NQVhfREVGRVJfUkVUUklFUykKKwkJCQlpZiAoKyth
dXhfZGVmZXJfcmV0cmllcyA+PSBBVVhfTUFYX0RFRkVSX1JFVFJJRVMpIHsKIAkJCQkJZ290byBm
YWlsOworCQkJCX0gZWxzZSB7CisJCQkJCWlmICgoKnBheWxvYWQtPnJlcGx5ID09IEFVWF9UUkFO
U0FDVElPTl9SRVBMWV9BVVhfREVGRVIpIHx8CisJCQkJCQkoKnBheWxvYWQtPnJlcGx5ID09IEFV
WF9UUkFOU0FDVElPTl9SRVBMWV9JMkNfT1ZFUl9BVVhfREVGRVIpKSB7CisJCQkJCQlpZiAocGF5
bG9hZC0+ZGVmZXJfZGVsYXkgPiAwKQorCQkJCQkJCW1zbGVlcChwYXlsb2FkLT5kZWZlcl9kZWxh
eSk7CisJCQkJCX0KKwkJCQl9CiAJCQkJYnJlYWs7CiAKIAkJCWNhc2UgQVVYX1RSQU5TQUNUSU9O
X1JFUExZX0kyQ19ERUZFUjoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
