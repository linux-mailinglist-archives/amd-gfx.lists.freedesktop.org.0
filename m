Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B9969DE9
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3308689D77;
	Mon, 15 Jul 2019 21:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBBC89D49
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7G7b/BWLpNl4pajm2QhxC3UXT+n17ob9cpM/+jS/TaMUfDjblcaXInWZkf2+PlLkbRQEPdc6MNb6za76Fn0tljjKKxfzS65ZwYiun7SuvqVYX4g+l/qDZDnjJyRRZm49hYL42trrPrfz4zdeP+Nmw6i1+wP5S9V7PPe6ZgnxakeaDF1MwS+DB+VzTz7Ai9CNw5+MAThKGAjxt8rNTON4Z9O5C370phjCNZD4U4lGebQKCEEYjODrZoHEXJo9wXDEs5eb9zKl1oYWhgWqw2Z1bQ67PDC7FEfTIK9S4RD+eVjFBzcI4zOcxD3mv3f5bK6QaBgxIV8ppar3oi94JKsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSXNPazUi8/5wGwB0PsDO+rUf0eK8kdcd9N7KOhMbYU=;
 b=K+NaxHPCnFUAHuluGFMELkwaoxWEos9i1DrVayfgrP8/LNG0+zmwdnKaQEOFZHpTDz0vCFigM8MShhRwwj6bLbvFeuAussKca9GaGe6a76ncTn7h4LMeXQIfBGJAa9z7exbtJYOfa1qan2tATGsmzQTstZ5y+v8mtXHSkBm7jHPiKHMj0ynDq4K21qihVRwV9VxsfnfX/q43cYlSr2PI7vHnWsBvgRU15AyAWytzpZ0SRxLua/yU0Zqj/zT392n4LlTZkid6z+hK3LJlxD4OJVNBAs3m5L7VZP/1Wdh0nZ2i3U0oMpSzkyARw5C2xzKqnMUdF/ATzraS46nXthK9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by BY5PR12MB3922.namprd12.prod.outlook.com (2603:10b6:a03:195::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:04 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:03 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:42 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 82/87] drm/amd/display: Add SMU version field to
 clk_mgr_internal
Date: Mon, 15 Jul 2019 17:20:44 -0400
Message-ID: <20190715212049.4584-83-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(2906002)(1076003)(5660300002)(54906003)(81156014)(70586007)(36756003)(70206006)(6916009)(305945005)(2870700001)(68736007)(4744005)(81166006)(316002)(8676002)(478600001)(50226002)(8936002)(2616005)(86362001)(76176011)(26005)(446003)(476003)(53936002)(51416003)(11346002)(186003)(48376002)(126002)(356004)(50466002)(486006)(4326008)(2351001)(47776003)(426003)(49486002)(336012)(2876002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3922; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b944ded-56fd-4e48-18b6-08d7096a7b58
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3922; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3922:
X-Microsoft-Antispam-PRVS: <BY5PR12MB392267810A6FE4537890B7FA82CF0@BY5PR12MB3922.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tO/fOd2Vo2xx98JVAYjAdopd+wEOlH3S8qnQXiHMunZmVTszvWBMqB5p7djnn7kmTVgCUdIG66V9lYfARbEmFyd0EdhfQ9B/UUudjG98pZth/y+1V7T+6leMAHq16zyckSaItRiYVngKEsGcVpc7ozJ/DUbRM8NpIFiEE8VakMyfDEhh6+x0UeJj/z2zvXWo1F3+HqhUP7YQyqLEI8sWiHXw/ZqttgUs1GbWv3N/xzaER1FAQcehLGc/4qtA4ORiAUnwXD3kyRP9szsGKlSXgk15c0m1iI/JexqyenxyY1plYoRL+YcQkJcehlO2n/5a+I8sf0xHCJLc5m0W4TXvA4gXwCJ4Mjg6U/SipWKpCZBzA9MC/0nRwKgavhbHEmy//X328svoFsPbABya3y9LyBaZw6IMkLmRB2YOcP0V7bI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:03.4797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b944ded-56fd-4e48-18b6-08d7096a7b58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3922
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSXNPazUi8/5wGwB0PsDO+rUf0eK8kdcd9N7KOhMbYU=;
 b=Ve5nwBUeH77PIbdkL0zR9Py6Gs3WZ6hBj88havF8kS0K7WXizOr4+8/fIFn7ys58JiDUICi9K2nJzTrVApgMvfwzIW9nwtpKOgIMx6S/6m4YqDUitROOBLGH88a/0Mx87ZjoFEYKhzpkHzzyk3HXJ7bByY07YuOpGu6wQLQctqI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Fatemeh Darbehani <fatemeh.darbehani@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRmF0ZW1laCBEYXJiZWhhbmkgPGZhdGVtZWguZGFyYmVoYW5pQGFtZC5jb20+CgpGb3Ig
c29tZSBwbGF0Zm9ybXMsIHdlIG5lZWQgdG8ga25vdyBTTVUgdmVyc2lvbiBmb3IgZHJpdmVyL1NN
VQpjb21wYXRpYmlsaXR5LiBUaGlzIGNoYW5nZSBhZGRzIHRoYXQgZmllbGQuCgpDaGFuZ2UtSWQ6
IEkyNTg2MTYxZmI2NDViZjBkMTZkMzBjOTE5NTRhODcxZjgzZTg3ZWRmClNpZ25lZC1vZmYtYnk6
IEZhdGVtZWggRGFyYmVoYW5pIDxmYXRlbWVoLmRhcmJlaGFuaUBhbWQuY29tPgpSZXZpZXdlZC1i
eTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9ody9jbGtfbWdyX2ludGVybmFsLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMv
aHcvY2xrX21ncl9pbnRlcm5hbC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2lu
Yy9ody9jbGtfbWdyX2ludGVybmFsLmgKaW5kZXggM2MxMDUxMjRkY2RkLi40YjU1MDVmYTk4MGMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21n
cl9pbnRlcm5hbC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcv
Y2xrX21ncl9pbnRlcm5hbC5oCkBAIC0xOTEsNiArMTkxLDcgQEAgc3RydWN0IHN0YXRlX2RlcGVu
ZGVudF9jbG9ja3MgewogCiBzdHJ1Y3QgY2xrX21ncl9pbnRlcm5hbCB7CiAJc3RydWN0IGNsa19t
Z3IgYmFzZTsKKwlpbnQgc211X3ZlcjsKIAlzdHJ1Y3QgcHBfc211X2Z1bmNzICpwcF9zbXU7CiAJ
c3RydWN0IGNsa19tZ3JfaW50ZXJuYWxfZnVuY3MgKmZ1bmNzOwogCi0tIAoyLjIyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
