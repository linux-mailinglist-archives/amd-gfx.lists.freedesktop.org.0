Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F53C9098
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFC56E1A2;
	Wed,  2 Oct 2019 18:16:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790041.outbound.protection.outlook.com [40.107.79.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101B6E1A2
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki6K3pzIZeeFLcHS+Xxsqw6i6rz3L4F3pVj7OQItpnwlsjpj6x8dzXZCiWRZlBzVfgheQUCXAyALTpUUIQcsestewpXCEWxOgka5uIU1O+7Y/p1cbj442eZGEPhomz9+lP4tj2J8apDz5qWCF/GuBcIhgYGNc/yFO7VOpWFyyAwDhfifwQYsg9G3S9gZJuMXY4w2/QA3dbc/Ni6DkSG7CuxdHzHasGpFF/Zb8eFBP08vfBnJM8KnfxKEFrmS864q2RRhkZC8KTTmrOY4F/ctFWQpLFSfwtglzqzqhUPPjBBvhcAoTilMoB5Z7wy+YK0WJmVtdPjYghz+9ccosNc5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ipZM+C6iGUJszbK9NuXkB23f1erWdUlUsUksVCNe1I=;
 b=nH+B5EsnNipyvZXdOgsI1OFXMkHuXnvj6AU1W8NnmxsfhrA1y/wBvj++UiX514Psa+/jkQBe3/LQcfsHpm3NYoBViBoL7YDvoYHEcDi8k80aAeJ5WrKVSaUCRHRc13/GFOIdXtHh+xVtmYTN0wbzWX4EYI8FvSMerf3lWqN/I8izvBBZMdon1L5h2Y1i298YKmpKcQeWTaOLb/7098I3g+WTFEB7aWgA0XHQa8XZA7C8Xt/B8LW3u3Bv+PaEbpQ03ByLMKAQO6zsbE5mzbqo1Mp5t6Nobq/DjbLkPCh/TqaJOu5RSBWyN+u0wDou+QYh6i+1Co6lxRm0mEXrDyf9OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0002.namprd12.prod.outlook.com (2603:10b6:4:1::12) by
 BN7PR12MB2724.namprd12.prod.outlook.com (2603:10b6:408:31::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:50 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM5PR12CA0002.outlook.office365.com
 (2603:10b6:4:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:50 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 32/38] drm/amd/display: 3.2.54
Date: Wed, 2 Oct 2019 14:16:27 -0400
Message-ID: <20191002181633.22805-33-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(428003)(199004)(189003)(26005)(186003)(2351001)(478600001)(2906002)(336012)(53416004)(50466002)(446003)(14444005)(2616005)(316002)(476003)(4326008)(426003)(11346002)(16586007)(126002)(486006)(356004)(76176011)(47776003)(5660300002)(7696005)(51416003)(6666004)(70586007)(70206006)(4744005)(36756003)(8936002)(6916009)(81166006)(81156014)(8676002)(50226002)(1076003)(48376002)(305945005)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2724; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b45249f-ba95-4387-1061-08d74764b1fc
X-MS-TrafficTypeDiagnostic: BN7PR12MB2724:
X-Microsoft-Antispam-PRVS: <BN7PR12MB272424E12A267B3BB57F12C6F99C0@BN7PR12MB2724.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Kukyof871iboeDJIE/dI62olrBU4mzR78+Fgi/ZxcfDhx2cR0H/234OfzBDT5eTzCzDULfFvcTIEh7iBmwpVFBWnlT9boGdUpB3fkWoBO7As5/HyRzD0XFP8XGld0BHjmtLVwaMiu5ckD053SRKaXAVGMrS9m2vVIh0J49mCUAb6HFB7G5N1TMLv+DflydkfX96U3Pur+kkhal9z75FJtWkLy6oZuS0nHl2Z7j7+m7zjJUzKAFHTRuH7Itmas06AZljPrEDKeKc+ioumVGud0KYo2JLiJMTnkWWpU0QxuSLMKzY/vpdo20GBP89q5pB40NElkPoVKaKn/u4NY25uDtt3qOHo7/YWBNxt49NjJcgsHuovKihhNY5LTl6E7I9cH+unf3cptVeDsFdS0ZH4zDPew808hDFO2+5OShfUu0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:50.3271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b45249f-ba95-4387-1061-08d74764b1fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2724
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ipZM+C6iGUJszbK9NuXkB23f1erWdUlUsUksVCNe1I=;
 b=R5QXekyEQ1xLwxzhaKoUt3ZBqHoQ5hoLh/985FVJMh9MjSC/XEipd12k6BKz+jkVOoX/Q+8dqZ7aVmqSfj24Kt8W0UC9PYSvrDDLq8emGBBXwSnPACzyBUaXzdCz/rIVu95H/9yjQANyB7DkwurwbY0U9nbZko+jfCaPCn5qKaE=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpDaGFuZ2UtSWQ6IEk4Y2NiMDI0MTFj
NTUyZjY3OWNiMDhhY2U4NjUyZjVjOWQ0ZmUzYjRmClNpZ25lZC1vZmYtYnk6IEFyaWMgQ3lyIDxh
cmljLmN5ckBhbWQuY29tPgpSZXZpZXdlZC1ieTogQXJpYyBDeXIgPEFyaWMuQ3lyQGFtZC5jb20+
CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjLmgKaW5kZXggYzA0YTFmNDBlMGJlLi40MWUzNjZmNTlmMTAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0zOSw3ICszOSw3IEBACiAjaW5jbHVkZSAiaW5jL2h3
L2RtY3UuaCIKICNpbmNsdWRlICJkbWwvZGlzcGxheV9tb2RlX2xpYi5oIgogCi0jZGVmaW5lIERD
X1ZFUiAiMy4yLjUzIgorI2RlZmluZSBEQ19WRVIgIjMuMi41NCIKIAogI2RlZmluZSBNQVhfU1VS
RkFDRVMgMwogI2RlZmluZSBNQVhfUExBTkVTIDYKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
