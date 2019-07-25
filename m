Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC3755E0
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 19:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D62A6E7E6;
	Thu, 25 Jul 2019 17:40:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770052.outbound.protection.outlook.com [40.107.77.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA696E7E6
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 17:40:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g669zPhr02n77NBR5uRwzMgJk0sw7CEpMH33kUxDURgXwDceil8Kx/CAzTmjJC1xsVA32CnTJge7r1D/Cqfj6bp3X2T/aWYBjuy04F3PEyLY0D/TFv59UiqPFiDDEkEKl3n6rEHlXGcHG+D2PD3rU9Oq/xCqG6KnewM8Crpx4qVh6mMG9nVd7vVzBYWN3IM15jeDF/TNJqWOIb0Npxo6oIFm+lUSh1N8JXVvwN3u94WKKFdgPoBPjDYPOmaazcYdnxpaGUKS/7xX/ZQPHspGyb94tSlQMBv2IhkeOhbSCMH6KLLzn2MUcrOD9ijM/tRA80whapuxN6Ow0oNhqdzM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdNAxISH8NafavfU/L06XrebTbQLBN5/7gbRN9YMeh4=;
 b=WYqHZiMIehxgn4gTW/D2iSyK41TPSzZk4n0De4VicrH2s+RpUEW7AlwXOIIqsB7QQfPumzx+JmO21ebywh2+Lhg5v3jvtW1hfEedvnnEw3UnWADl1xWxEdeXHD7y8HJXsEXewa0bX1aUn7XdwIHPMILcW4Uuapip+v8FzzzuvJWBeJjjL5bUcXR52T+oQ639DqfxWO0BOTI+EvUmDifFh0baKf6e9ZRS7vCzOFUDvzPjN+5OAu+si9Ynm/D2Aygk8sZUnNpIHZucPglwuDMzPCiIMLjKJy9NFn1KxHjg9MAJbFbcIbVXXGmIoheLjKP+HjwYEb3zsk1omwQ0hFcoXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0042.namprd12.prod.outlook.com (2603:10b6:903:129::28)
 by MWHPR12MB1583.namprd12.prod.outlook.com (2603:10b6:301:11::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Thu, 25 Jul
 2019 17:40:32 +0000
Received: from CO1NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by CY4PR12CA0042.outlook.office365.com
 (2603:10b6:903:129::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15 via Frontend
 Transport; Thu, 25 Jul 2019 17:40:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT035.mail.protection.outlook.com (10.152.80.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 17:40:31 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 25 Jul 2019 12:40:30 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Nicholas.Kazlauskas@amd.com>,
 <Harry.Wentland@amd.com>
Subject: [PATCH] drm/amd/display: Use switch table for dc_to_smu_clock_type
Date: Thu, 25 Jul 2019 13:40:29 -0400
Message-ID: <20190725174029.27009-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(2980300002)(428003)(189003)(199004)(86362001)(5660300002)(54906003)(81166006)(81156014)(8936002)(110136005)(36756003)(478600001)(68736007)(53936002)(316002)(47776003)(70586007)(356004)(51416003)(26005)(2906002)(8676002)(50226002)(70206006)(2870700001)(1076003)(305945005)(2876002)(186003)(6636002)(2201001)(476003)(2616005)(50466002)(4326008)(486006)(49486002)(126002)(336012)(426003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1583; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac39c61f-eb65-45ff-cb28-08d7112730cb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1583; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1583:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1583F1E4E7C01AAF47FA8F3682C10@MWHPR12MB1583.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YePLlGQHHBBL7IoHsWScX73b23gWhBmvW3DhhZht2GZ20XHxBW/sJG9/53njHfZdr5oYKRW1dqhb7ZemdCbOelEn0RZTEJl2RsE3ymGjHnzSjkaDduGqZ46cGqJpRS++v41MwU5bvMGuTWE/TLYIAw3hJqJGOjdvcgUhX0thjSpHJcQP+jurS6b8rng7IO42mEbV+BGzlhGUDwlV3AXZNA02fRC0oy2X91vXnncxix0ZiCD/od/IvPNG2706VCVYh2XDYF5Q4RgvY4CZ8aXAPigN8aaSBfGtpbX8rnbTwyKF2WZs/XX2JJL2whYqRs2/vtWmeCWsl8VELNdTkjKe2+eWliDMKHNOwn+l7OsMyjOrGZQwFjlSu2Yzd9hSRxLTha1XHVIHHL2M5rfa7gPcvd06heMTZFK8Hrv9LUm3xGw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 17:40:31.4271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac39c61f-eb65-45ff-cb28-08d7112730cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1583
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdNAxISH8NafavfU/L06XrebTbQLBN5/7gbRN9YMeh4=;
 b=jj5N71UecgSuwEHa/4hKJdVBHPvZTRYUT6s+OgKlHU7mY5pJXq2lKmJyR99GvNTgvqyuCVKQ7Wbrd12FJjnTlfqGUs6YKoO1H8wfkWxQckWqXZRES7ypcntHCSZQUttZcyjH8mE/yQ62BJ8QOif0SQpFQdFicqFKEv1T5SB+7gU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, natechancellor@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpVc2luZyBhIHN0YXRpYyBpbnQgYXJy
YXkgd2lsbCBjYXVzZSBlcnJvcnMgaWYgdGhlIGdpdmVuIGRtX3BwX2Nsa190eXBlCmlzIG91dC1v
Zi1ib3VuZHMuIEZvciByb2J1c3RuZXNzLCB1c2UgYSBzd2l0Y2ggdGFibGUsIHdpdGggYSBkZWZh
dWx0CmNhc2UgdG8gaGFuZGxlIGFsbCBpbnZhbGlkIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtX3BwX3NtdS5jICB8IDM4ICsrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jCmlu
ZGV4IDIwZTgyYzlmNmQ2Ny4uZGYxZWZiODIzOGQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYwpAQCAtMTUy
LDE4ICsxNTIsMzIgQEAgc3RhdGljIHZvaWQgZ2V0X2RlZmF1bHRfY2xvY2tfbGV2ZWxzKAogc3Rh
dGljIGVudW0gc211X2Nsa190eXBlIGRjX3RvX3NtdV9jbG9ja190eXBlKAogCQllbnVtIGRtX3Bw
X2Nsb2NrX3R5cGUgZG1fcHBfY2xrX3R5cGUpCiB7Ci0jZGVmaW5lIERDQ0xLX01BUF9TTVVDTEso
ZGNjbGssIHNtdWNsaykgXAotCVtkY2Nsa10gPSBzbXVjbGsKLQotCXN0YXRpYyBpbnQgZGNfY2xr
X3R5cGVfbWFwW10gPSB7Ci0JCURDQ0xLX01BUF9TTVVDTEsoRE1fUFBfQ0xPQ0tfVFlQRV9ESVNQ
TEFZX0NMSywJU01VX0RJU1BDTEspLAotCQlEQ0NMS19NQVBfU01VQ0xLKERNX1BQX0NMT0NLX1RZ
UEVfRU5HSU5FX0NMSywJU01VX0dGWENMSyksCi0JCURDQ0xLX01BUF9TTVVDTEsoRE1fUFBfQ0xP
Q0tfVFlQRV9NRU1PUllfQ0xLLAlTTVVfTUNMSyksCi0JCURDQ0xLX01BUF9TTVVDTEsoRE1fUFBf
Q0xPQ0tfVFlQRV9EQ0VGQ0xLLAlTTVVfRENFRkNMSyksCi0JCURDQ0xLX01BUF9TTVVDTEsoRE1f
UFBfQ0xPQ0tfVFlQRV9TT0NDTEssCVNNVV9TT0NDTEspLAotCX07Ci0KLQlyZXR1cm4gZGNfY2xr
X3R5cGVfbWFwW2RtX3BwX2Nsa190eXBlXTsKKwllbnVtIHNtdV9jbGtfdHlwZSBzbXVfY2xrX3R5
cGUgPSAwOworCisJc3dpdGNoIChkbV9wcF9jbGtfdHlwZSkgeworCWNhc2UgRE1fUFBfQ0xPQ0tf
VFlQRV9ESVNQTEFZX0NMSzoKKwkJc211X2Nsa190eXBlID0gU01VX0RJU1BDTEs7CisJCWJyZWFr
OworCWNhc2UgRE1fUFBfQ0xPQ0tfVFlQRV9FTkdJTkVfQ0xLOgorCQlzbXVfY2xrX3R5cGUgPSBT
TVVfR0ZYQ0xLOworCQlicmVhazsKKwljYXNlIERNX1BQX0NMT0NLX1RZUEVfTUVNT1JZX0NMSzoK
KwkJc211X2Nsa190eXBlID0gU01VX01DTEs7CisJCWJyZWFrOworCWNhc2UgRE1fUFBfQ0xPQ0tf
VFlQRV9EQ0VGQ0xLOgorCQlzbXVfY2xrX3R5cGUgPSBTTVVfRENFRkNMSzsKKwkJYnJlYWs7CisJ
Y2FzZSBETV9QUF9DTE9DS19UWVBFX1NPQ0NMSzoKKwkJc211X2Nsa190eXBlID0gU01VX1NPQ0NM
SzsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJRFJNX0VSUk9SKCJETV9QUExJQjogaW52YWxpZCBj
bG9jayB0eXBlOiAlZCFcbiIsCisJCQkgIGRtX3BwX2Nsa190eXBlKTsKKwkJc211X2Nsa190eXBl
ID0gMDsKKwkJYnJlYWs7CisJfQorCisJcmV0dXJuIHNtdV9jbGtfdHlwZTsKIH0KIAogc3RhdGlj
IGVudW0gYW1kX3BwX2Nsb2NrX3R5cGUgZGNfdG9fcHBfY2xvY2tfdHlwZSgKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
