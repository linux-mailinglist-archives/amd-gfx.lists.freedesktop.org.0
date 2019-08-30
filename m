Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A69A36B9
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 14:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7687B6E2B6;
	Fri, 30 Aug 2019 12:25:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEB36E2B6
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 12:25:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA/qMJtjKlSU9Kmb5fZ0nwhnSuyHmL6prwY3yVFNUSrKQQXzAVIBX0zCdKu54TsALuKc9AlxYMnHVWCF6PKksW0iKBqpI/pUFNLX/hwmx6rPNlbkgty/0xLiCELHGx9o6cyouVc2gIUOjy8wnKkJZH/yKfidoAmbFNa5OjNLip0dm5w1sr8irMYI3QuqqnDTyfuv87EllN4QvCxk58XfHHeySTeJ5TTUBVuxoguHpKnAsdDN9IUnTlFvhdRGxBMo/ip9A1LLn7S7filNGKKmE8ZdXNHFQsHkIRf47YZ/Qgrfunps5iMkJUb23jpmLSMu9nK4LztEQs5kHvXpv/r7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/wXqt3o+i1++DaHwWMzztV8qBkaIubxW6B+MYJsW0s=;
 b=J7OCbO95GNFEePUSQ9ZW01kN2APruMmsU6agwCEUFXOrFCyWkkCKxF5Pt7zb1B6K5q919WofBt1gvK0YZ/SA/o+2Lyy7CJnsaRDaKTCpMh1bJTjnOGofwPa47lqTH3qdqkDMfdnJg4YmYq6jllLsnProJwbo3jWCg+MPbnRBFiHrrfU+vSzLOYr1IspWby2YTqae/liTUW6yR5Y0fG+yKCRtyj4ZeXLE8UYUCpiYiwTb9JLauMJpV5/dEkCvG+8lo+cp5vwT2smTV12jr+87odMI/GZAyNN0XHlcarbOGBFOWdJtxohrmPBUp5aQ3GbcHFVcHR9KINASuCxNHQPFFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0084.namprd12.prod.outlook.com (2603:10b6:0:57::28) by
 DM5PR1201MB0172.namprd12.prod.outlook.com (2603:10b6:4:51::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Fri, 30 Aug 2019 12:25:11 +0000
Received: from CO1NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0084.outlook.office365.com
 (2603:10b6:0:57::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Fri, 30 Aug 2019 12:25:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT021.mail.protection.outlook.com (10.152.80.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 12:25:10 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 07:25:09 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <andrey.grodzovsky@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <hawking.zhang@amd.com>
Subject: [PATCH 0/4] add support for ras page retirement
Date: Fri, 30 Aug 2019 20:24:49 +0800
Message-ID: <20190830122453.19703-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(2980300002)(428003)(199004)(189003)(8936002)(186003)(305945005)(6636002)(36756003)(110136005)(26005)(2616005)(50226002)(8676002)(126002)(51416003)(81166006)(476003)(356004)(336012)(48376002)(6666004)(7696005)(81156014)(5660300002)(70586007)(486006)(4744005)(70206006)(2906002)(1076003)(47776003)(53416004)(86362001)(426003)(50466002)(478600001)(4326008)(2201001)(16586007)(316002)(53936002)(79990200002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0172; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ee5d4cd-f656-4c4e-2acc-08d72d4519f8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB0172; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0172:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB01729AC0E7C054518E990D47B0BD0@DM5PR1201MB0172.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yyg1Y4x9UDTW3GxR+64nAnOYODsEuB79TG+sJQnpKoR4okK+g3b6Pu0cWT/7LCMW4qTt6RQFC8DcpgyWoQa9Jkk3nJbGJuew3CPRA9gTYKKQKsOj7YSOuwbKPpwPjIy+oDg/Zx/p4UiXKpPrAx8BAw/pexfN3d0WzHwRT9x7OMiw9iqSqdHE+RqfE6FJUk+4wLbLAoMt/VQuJrSrnR+Vt/Ns6k4IDHBP71hp5QHzlMIwV/Ke+rc6WcYRavtZeD2Zbd1op37AYwc4sC6BkKv/6GEykZOp2M15RZfDX/cKyDx6mjTL6Ja45Ed+FGcH/2GQrfD/DKd8fKUkv3HasFf816soAosdpin04+UpBdVAZjx2YyPiS4Fitx4iqEYWpnKVAV2l22kE7JBg7UdDgJUrqbnMIe7z96B12Wm+CHDoY9Zg2QMXA7oEoOi0eOXojXx0xJOvQLBfQS8YQp8SVMEocg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 12:25:10.5805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee5d4cd-f656-4c4e-2acc-08d72d4519f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0172
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/wXqt3o+i1++DaHwWMzztV8qBkaIubxW6B+MYJsW0s=;
 b=vpoFUd2Il7SFdeHSkL+dVIN2iowLSxvxwkmdjoPRMgRrK2ktmYfBKpFYzcH3Di2BIzm6dIFhT/5tA0eiyTGvC9Vg9bpVlU0EciBb3Q+Fvy7QYIcYqQGOopjF7TJ9Lj2GlVOY4iK9HTQ/32tQlsxanOWgjLop6Z1JBCeU+wlV77A=
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

VGhpcyBzZXJpZXMgc2F2ZXMgdW1jIGVycm9yIHBhZ2UgaW5mbyBpbnRvIGEgcmVjb3JkIHN0cnVj
dHVyZSBhbmQgc3RvcmVzCnJlY29yZHMgdG8gZWVwcm9tLCBpdCBhbHNvIGxvYWRzIGVycm9yIHJl
Y29yZHMgZnJvbSBlZXByb20gYW5kIHJlc2VydmVycwpyZWxhdGVkIHJldGlyZWQgcGFnZXMgZHVy
aW5nIGdwdSBpbml0LgoKClRhbyBaaG91ICg0KToKICBkcm0vYW1kZ3B1OiBjaGFuZ2UgcmFzIGJw
cyB0eXBlIHRvIGVlcHJvbSB0YWJsZSByZWNvcmQgc3RydWN0dXJlCiAgZHJtL2FtZGdwdTogSG9v
ayBFRVBST00gdGFibGUgdG8gUkFTCiAgZHJtL2FtZGdwdTogc2F2ZSB1bWMgZXJyb3IgcmVjb3Jk
cwogIGRybS9hbWRncHU6IG1vdmUgdGhlIGNhbGwgb2YgcmFzIHJlY292ZXJ5X2luaXQgYW5kIGJh
ZCBwYWdlIHJlc2VydmUgdG8KICAgIHByb3BlciBwbGFjZQoKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8ICAxNiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jICAgIHwgMTcwICsrKysrKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oICAgIHwgIDE4ICsrLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICAgIHwgIDI5ICsrKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICAgICB8ICAzOSArKysrLQogNSBmaWxlcyBjaGFuZ2Vk
LCAyMDIgaW5zZXJ0aW9ucygrKSwgNzAgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
